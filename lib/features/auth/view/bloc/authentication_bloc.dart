import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:citiquiz/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:citiquiz/features/auth/domain/repo/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationRepository authenticationRepository =
      AuthenticationRepositoryImpl();
  AuthenticationBloc() : super(AuthInitial()) {
    on<Init>((event, emit) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? email = preferences.getString('email');
      String? password = preferences.getString('password');
      if (email != null && password != null) {
        add(SignIn(email: email, password: password));
      }
    });
    on<SignIn>((event, emit) async {
      emit(AuthLoading());
      try {
        await authenticationRepository.signIn(event.email, event.password);
        emit(
          AuthSuccess(
            email: event.email.trim(),
            password: event.password.trim(),
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(AuthError());
      }
    });
    on<SignUp>((event, emit) async {
      emit(AuthLoading());
      try {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('nick', event.nick);
        await authenticationRepository.signUp(event.email, event.password);
        emit(
          AuthSuccess(
            email: event.email.trim(),
            password: event.password.trim(),
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(AuthError());
      }
    });
    on<LogOut>((event, emit) => emit(AuthInitial()));
  }
}
