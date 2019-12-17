package com.david.avv.validation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Constraint(validatedBy=ValidarEmailReglasValidacion.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)

public @interface ValidarEmail {

	String message() default "El email no es válido";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default{};
}
