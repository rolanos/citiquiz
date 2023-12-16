import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/core/validator.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Validator validator;
  final TextEditingController controller;
  bool _validation = false;

  InputField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null) {
            return 'Ошибка ввода';
          }
          if (value.isEmpty) {
            return null;
          }
          _validation = validator.validate(value);
          if (!_validation) {
            return getErrorMessage(validator);
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 18.0,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: ColorsUI.lime,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorsUI.lime,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorsUI.lime,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorsUI.lime,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorsUI.red,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          hintText: hintText,
          hintStyle: textTheme.bodyMedium,
        ),
      ),
    );
  }
}

String getErrorMessage(Validator validator) {
  if (validator is EmailValidator) {
    return "Неправильный формат почты";
  }
  if (validator is PasswordValidator) {
    return "Неправильный формат пароля";
  }
  if (validator is NameValidator) {
    return "Неправильный формат имени";
  }
  return "Ошибка";
}
