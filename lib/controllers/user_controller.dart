import 'package:email_validator/email_validator.dart';
import 'package:flutter_reactive_form_mobx/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:date_format/date_format.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  UserModel userModel;

  _UserControllerBase() {
    userModel = UserModel();
  }

  bool get nameIsValid {
    return validateName == null;
  }

  bool get emailIsValid {
    return validateEmail == null;
  }

  bool get birthdayIsValid {
    return validateBirthday == null;
  }
  
  bool get userisValid {
    return nameIsValid && emailIsValid && birthdayIsValid;
  }

  String get iconByUserAge {
    if(userModel.age == null) return '';
    if(userModel.age >= 0 && userModel.age <= 3) return 'assets/baby.png';    
    if(userModel.age > 3 && userModel.age <= 12) return 'assets/kid.png';
    if(userModel.age > 13 && userModel.age <= 19) return 'assets/young.png';
    if(userModel.age > 19 && userModel.age <= 59) return 'assets/adult.png';

    return 'assets/oldman.png';
  }

  String get validateName {
    if (userModel.name == null || userModel.name.isEmpty) {
      return 'name is required!';
    }

    return null;
  }

  String get validateEmail {
    if (userModel.email == null || userModel.email.isEmpty) {
      return 'email adress is required!';
    }

    if (!EmailValidator.validate(userModel.email)) {
      return ' email address is invalid!';
    }

    return null;
  }

  String get validateBirthday {
    if (userModel.birthday == null) {
      return 'birthday is required!';
    }

    return null;
  }

  String get formattedBirthdayDate {
    return userModel.birthday != null
        ? formatDate(userModel.birthday, [yyyy, '-', mm, '-', dd])
        : '';
  }
}
