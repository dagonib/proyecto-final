package com.david.avv.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class ValidarEmailReglasValidacion implements ConstraintValidator<ValidarEmail, String> {
	
	@Override
	public void initialize(ValidarEmail email) {}
	
	@Override
	public boolean isValid(String email, ConstraintValidatorContext cxt) {
		
		String regex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
				+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";;
		
		Pattern pat = Pattern.compile(regex);
		Matcher mat = pat.matcher(email);		
		
		return mat.matches();
	}

}
