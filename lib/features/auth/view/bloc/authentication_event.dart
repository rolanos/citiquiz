part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class SignIn extends AuthenticationEvent {
  final String email;
  final String password;

  SignIn({required this.email, required this.password});
}

class SignUp extends AuthenticationEvent {
  final String email;
  final String password;

  final String nick;

  SignUp({required this.nick, required this.email, required this.password});
}

class LogOut extends AuthenticationEvent {}

class Init extends AuthenticationEvent {}
