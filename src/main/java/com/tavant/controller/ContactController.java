package com.tavant.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.tavant.domain.Contact;
import com.tavant.domain.Transaction;
import com.tavant.domain.User;
import com.tavant.services.ContactService;
import com.tavant.validator.ContactValidator;

@Controller
public class ContactController {

	private ContactService contactService;
	private ContactValidator contactValidator;

	@Autowired
	public ContactController(ContactService contactService,
			ContactValidator contactValidator) {
		this.contactService = contactService;
		this.contactValidator = contactValidator;
	}

	@RequestMapping(value = "/addContact", method = RequestMethod.GET)
	public ModelAndView addContactForm(HttpServletRequest request,
			ModelMap model) {

		// if user session is empty, return to master page
		if (request.getSession().getAttribute("currentUser") == null) {
			return new ModelAndView("redirect:login.html");
		}

		Contact contact = new Contact();
		model.addAttribute(contact);
		return new ModelAndView("contactAddForm");
	}

	@RequestMapping(value = "/addContact", method = RequestMethod.POST)
	public ModelAndView onSubmit(@ModelAttribute("contact") Contact contact,
			BindingResult result, SessionStatus status,
			HttpServletRequest request) throws Exception {

		ModelMap model = new ModelMap();

		contactValidator.validate(contact, result);
		if (result.hasErrors()) {
			return new ModelAndView("contactAddForm");
		}

		User user = (User) request.getSession().getAttribute("currentUser");
		contact.setUserId(user.getUserId());
		contactService.addContact(contact);

		model.addAttribute(contact);

		List<Contact> contactsList = contactService.selectAllContacts(user
				.getUserId());
		request.getSession().setAttribute("contactsList", contactsList);

		return new ModelAndView("redirect:showContacts.html", model);

	}

	@RequestMapping(value = "/showContacts")
	public ModelAndView showContactList(HttpServletRequest request, ModelMap model)
			throws Exception {

		// if user session is empty, return to master page
		if (request.getSession().getAttribute("currentUser") == null) {
			return new ModelAndView("redirect:login.html");
		}

//		System.out.println(request.getSession().getAttribute("ss"));
		String cantdelete = request.getParameter("cantdelete");
		String name = request.getParameter("name");
		
		if(cantdelete != null){
			model.addAttribute("cantdelete",cantdelete);
			model.addAttribute("contactName",name);
		}
		
		User user = ((User) request.getSession().getAttribute("currentUser"));
		List<Contact> contactsList = contactService.selectAllContacts(user
				.getUserId());
		request.getSession().setAttribute("contactsList", contactsList);
		
		return new ModelAndView("listOfContacts", model);
	}

	@RequestMapping(value = "/editContact", method = RequestMethod.GET)
	public ModelAndView editContactForm(HttpServletRequest request,
			ModelMap model) {
		// if user session is empty, return to master page
		if (request.getSession().getAttribute("currentUser") == null) {
			return new ModelAndView("redirect:login.html");
		}

		Contact contact = contactService.selectById(Integer.parseInt(request
				.getParameter("contactId")));
		model.addAttribute(contact);
		return new ModelAndView("editContactForm", model);
	}

	@RequestMapping(value = "/editContact", method = RequestMethod.POST)
	public ModelAndView onEdit(@ModelAttribute("contact") Contact contact,
			BindingResult result, SessionStatus status,
			HttpServletRequest request,ModelMap model) throws Exception {

		contactValidator.validate(contact, result);
		// System.out.println("from post method " + contact);
		if(result.hasErrors()){
			return new ModelAndView("editContactForm");
		}
		
		
		contactService.updateContact(contact);
		
		
		return showContactList(request,model);
	}

	@RequestMapping("/deleteContact")
	public ModelAndView deleteContact(HttpServletRequest request,ModelMap model)
			throws Exception {
		// if user session is empty, return to master page
		if (request.getSession().getAttribute("currentUser") == null) {
			return new ModelAndView("redirect:login.html");
		}

		int id = Integer.parseInt(request.getParameter("contactId"));
		String name = request.getParameter("contactName");
		boolean cantDeleteContact = false;
		cantDeleteContact = ((HashMap<Integer, Transaction>) request
				.getSession().getAttribute("transHashMap")).containsKey(id);
		if (!cantDeleteContact) {
			contactService.deleteContact(id);
		}
		else {			
		}
				
		// System.out.println("Deleted Contact: "+
		// request.getParameter("contactName"));
		return new ModelAndView("redirect:showContacts.html?name="+name+"&cantdelete="+cantDeleteContact, model);
	}

}
