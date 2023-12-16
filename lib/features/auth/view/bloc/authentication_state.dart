part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

class AuthInitial extends AuthenticationState {}

class AuthEmpty extends AuthenticationState {}

class AuthLoading extends AuthenticationState {}

class AuthError extends AuthenticationState {}

class AuthSuccess extends AuthenticationState {
  final String email;
  final String password;

  AuthSuccess({required this.email, required this.password});
}
