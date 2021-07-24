package com.osp.validator.content;

import com.osp.common.Utils;
import com.osp.model.Category2;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by Admin on 2/26/2018.
 */
@Component
public class CategoryEditValidator implements Validator {
    @Override
    public boolean supports(Class<?> paramClass) {
        return Category2.class.equals(paramClass);
    }

    @Override
    public void validate(Object obj, Errors errors) {
        Utils.trimAllFieldOfObject(obj);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name.error");
    }
}
