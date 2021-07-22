package com.osp.validator.user;

import com.osp.common.Utils;
/*import org.springframework.security.core.userdetails.User;*/
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import com.osp.model.admin.User;

/**
 * Created by Admin on 12/27/2017.
 */
@Component
public class UserAddValidator implements Validator {
    @Override
    public boolean supports(Class<?> paramClass) {
        return User.class.equals(paramClass);
    }

    @Override
    public void validate(Object obj, Errors errors) {
//        User user = (User) obj;
//        if(user.getId()==null)  errors.rejectValue("id", "NotEmpty.userEdit.id");
//        if(StringUtils.isBlank(user.getFullName())){
//            errors.rejectValue("fullName", "NotEmpty.user.fullName");
//        }
        Utils.trimAllFieldOfObject(obj);
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "username.error");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.error");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullName", "fullName.error");
        User user = (User) obj;
        if(user.getPassword().length()<6 || user.getPassword().length()>15){
            errors.rejectValue("password", "password.error");
        }

    }
}
