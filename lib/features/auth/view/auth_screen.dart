import 'package:auto_size_text/auto_size_text.dart';
import 'package:citiquiz/features/auth/view/bloc/authentication_bloc.dart';
import 'package:citiquiz/features/auth/view/widget/container_button.dart';
import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/core/constants.dart';
import 'package:citiquiz/features/core/validator.dart';
import 'package:citiquiz/features/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/input_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nickController = TextEditingController();

  bool isLogIn = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => HomeScreen(),
                transitionDuration: Duration(milliseconds: 370),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorsUI.black, ColorsUI.lime],
                stops: [0.4, 1],
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.17,
                  ),
                  Image.asset(
                    appLogoPath,
                    width: size.width * 0.4,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  AutoSizeText(
                    'Авторизация',
                    style: textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          isLogIn = true;
                        }),
                        child: AutoSizeText(
                          'Вход',
                          style: isLogIn == false
                              ? textTheme.bodyMedium!.copyWith(fontSize: 24)
                              : textTheme.bodyLarge!.copyWith(fontSize: 24),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          isLogIn = false;
                        }),
                        child: AutoSizeText(
                          'Регистрация',
                          style: isLogIn == true
                              ? textTheme.bodyMedium!.copyWith(fontSize: 24)
                              : textTheme.bodyLarge!.copyWith(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  (isLogIn)
                      ? logIn(
                          context,
                          emailController,
                          passwordController,
                        )
                      : signUp(
                          context,
                          emailController,
                          passwordController,
                          nickController,
                        ),
                  Spacer(),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: size.height * 0.07),
                    child: GestureDetector(
                      onTap: () {
                        if (isLogIn) {
                          setState(() => isLogIn = false);
                        } else {
                          setState(() => isLogIn = true);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            isLogIn == false
                                ? 'Есть аккаунт? '
                                : 'Нет аккаунта? ',
                            style: textTheme.bodyMedium,
                          ),
                          AutoSizeText(
                            isLogIn == false ? 'Войти' : 'Зарегистрироваться',
                            style: textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget logIn(
  BuildContext context,
  TextEditingController email,
  TextEditingController password,
) {
  return Column(
    children: [
      InputField(
        controller: email,
        hintText: 'Введите email',
        prefixIcon: Icons.person,
        validator: EmailValidator(),
      ),
      const SizedBox(
        height: 10.0,
      ),
      InputField(
        controller: password,
        hintText: 'Введите пароль',
        prefixIcon: Icons.https,
        validator: PasswordValidator(),
      ),
      const SizedBox(
        height: 10.0,
      ),
      ContainerButton(
          onTap: () {
            BlocProvider.of<AuthenticationBloc>(context).add(
              SignIn(
                email: email.text.trim(),
                password: password.text.trim(),
              ),
            );
          },
          text: 'Продолжить'),
    ],
  );
}

Widget signUp(BuildContext context, TextEditingController email,
    TextEditingController password, TextEditingController nick) {
  return Column(
    children: [
      InputField(
        controller: email,
        hintText: 'Введите email',
        prefixIcon: Icons.person,
        validator: EmailValidator(),
      ),
      const SizedBox(
        height: 10.0,
      ),
      InputField(
        controller: nick,
        hintText: 'Введите имя или ник',
        prefixIcon: Icons.person,
        validator: NameValidator(),
      ),
      const SizedBox(
        height: 10.0,
      ),
      InputField(
        controller: password,
        hintText: 'Введите пароль',
        prefixIcon: Icons.https,
        validator: PasswordValidator(),
      ),
      const SizedBox(
        height: 10.0,
      ),
      ContainerButton(
          onTap: () {
            BlocProvider.of<AuthenticationBloc>(context).add(
              SignUp(
                email: email.text.trim(),
                nick: nick.text.trim(),
                password: password.text.trim(),
              ),
            );
          },
          text: 'Зарегистрироваться'),
    ],
  );
}
