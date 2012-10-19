package com.tavant.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tavant.domain.ChangePassword;
import com.tavant.domain.User;

@Service("passwordValidator")
public class PasswordValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "oldPassword",
				"required.oldPassword", "Field name is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "newPassword",
				"required.newPassword", "Field name is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword",
				"required.confirmPassword", "Field name is required.");
		
		
		ChangePassword chanPassword=(ChangePassword)target;
		String newPass=chanPassword.getNewPassword();
		String confPass=chanPassword.getConfirmPassword();
		
		if (!(newPass.trim().isEmpty() || confPass.trim().isEmpty())) {
			if (newPass.length()<6 || newPass.length()>20) {
				errors.rejectValue("newPassword", "length.password");
			}
			else if (!newPass.equals(confPass)) {
				errors.rejectValue("confirmPassword", "notmatch.password");
				
			}
			
		}

	}
}
