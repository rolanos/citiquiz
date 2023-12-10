abstract class Validator {
  const Validator();

  bool validate(String str);
}

///Пустой валидатор - всегда вернет true
class EmptyValidator extends Validator {
  const EmptyValidator();

  @override
  bool validate(String str) {
    return true;
  }
}

class PasswordValidator extends Validator {
  const PasswordValidator();

  @override
  bool validate(String str) {
    if (str.isEmpty) {
      return false;
    } else {
      if (str.length < 6) {
        return false;
      }
      if (RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(str)) {
        return true;
      }
      return true;
    }
  }
}

///Валидатор для имени
class NameValidator extends Validator {
  @override
  bool validate(String str) {
    if (str.isEmpty) {
      return false;
    }
    if (RegExp(r'^[A-Za-zа-яА-Я]+$').hasMatch(str)) {
      return true;
    } else {
      return false;
    }
  }
}

///Валидатор для номера почты
class EmailValidator extends Validator {
  @override
  bool validate(String str) {
    if (str.isEmpty) {
      return false;
    }
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
        .hasMatch(str)) {
      return true;
    }
    return false;
  }
}
