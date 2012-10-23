package com.tavant.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tavant.domain.ChangePassword;
import com.tavant.domain.User;
import com.tavant.services.JavaMD5HashService;
import com.tavant.services.UserService;
import com.tavant.validator.PasswordValidator;
import com.tavant.validator.ProfileValidator;

@Controller
public class UserProfileController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProfileValidator profileValidator;
	
	@Autowired
	private JavaMD5HashService jHashService;

	@Autowired
	private PasswordValidator passwordValidator;

	@RequestMapping(value = "/profile")
	public ModelAndView showProfile(HttpServletRequest request, ModelMap model) {
		// if user session is empty, return to master page
		if (request.getSession().getAttribute("currentUser") == null) {
			return new ModelAndView("redirect:login.html");
		}

		return new ModelAndView("profilePage");

	}

	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public ModelAndView editProfilePage(HttpServletRequest request,
			ModelMap model) {

		// if user session is empty, return to master page
		if (request.getSession().getAttribute("currentUser") == null) {
			return new ModelAndView("redirect:login.html");
		}
		model.addAttribute(new User());

		// System.out.println((User)request.getSession().getAttribute("currentUser"));
		return new ModelAndView("editProfilePage", model);

	}

	@RequestMapping(value = "/editProfile", method = RequestMethod.POST)
	public ModelAndView onSubmit(User user, BindingResult result,
			HttpServletRequest request, ModelMap model) {

		profileValidator.validate(user, result);
		if (result.hasErrors()) {
			return new ModelAndView("editProfilePage");
		}

		((User) request.getSession().getAttribute("currentUser")).setName(
				user.getFirstName(), user.getLastName());
		userService.updateUser((User) request.getSession().getAttribute(
				"currentUser"));

		// System.out.println((User)request.getSession().getAttribute("currentUser"));
		return new ModelAndView("profilePage");

	}

	@RequestMapping("user-settings")
	public ModelAndView userSettings(HttpServletRequest request) {
		
		
		return new ModelAndView("userSettings");
	}
	
	@RequestMapping(value = "/change-password", method = RequestMethod.GET)
	public ModelAndView loadChangePasswordForm(HttpServletRequest request) {
		if (request.getSession().getAttribute("currentUser") == null) {
			return new ModelAndView("redirect:login.html");
		}
		ModelMap model = new ModelMap();
		model.addAttribute("changePassword", new ChangePassword());
		return new ModelAndView("changePasswordForm", model);

	}

	@RequestMapping(value = "/change-password", method = RequestMethod.POST)
	public ModelAndView onChange(ChangePassword changePassword,
			BindingResult result, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("currentUser");

		String pass = jHashService.md5(changePassword.getOldPassword());

		passwordValidator.validate(changePassword, result);
		
		if (!(changePassword.getOldPassword().isEmpty() || pass.equals(user.getPassword()))) {
			result.rejectValue("oldPassword", "wrong.password");
		}
				
		if (result.hasErrors()) {
			return new ModelAndView("changePasswordForm");
		}
		
		String newPassword = changePassword.getConfirmPassword();
		user.setPassword(jHashService.md5(newPassword));
		userService.updatePassword(user);

		return new ModelAndView("redirect:home.html");
		
/*		if ((pass.equals(user.getPassword()))
				&& (changePassword.getNewPassword().equals(changePassword
						.getConfirmPassword()))) {
			String newPassword = changePassword.getConfirmPassword();
			user.setPassword(jHashService.md5(newPassword));
			userService.updatePassword(user);

			return new ModelAndView("redirect:home.html");
		}

		else {
			return new ModelAndView("redirect:home.html");
		}
*/	}
}
