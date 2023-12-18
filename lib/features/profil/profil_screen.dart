import 'package:citiquiz/features/auth/view/auth_screen.dart';
import 'package:citiquiz/features/auth/view/bloc/authentication_bloc.dart';
import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/support/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false || snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsUI.lime,
                ),
              );
            }
            String? email;
            if (state is AuthSuccess) {
              email = state.email;
            }
            String? nick = snapshot.data!.getString('nick');
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(48.0),
                  color: Colors.white,
                  child: SizedBox(
                    height: size.height * 0.17,
                    width: size.width,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: size.height * 0.13,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              color: ColorsUI.grey.withOpacity(0.25),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          left: 16,
                          child: Container(
                            width: size.width * 0.14,
                            height: size.width * 0.14,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(179, 141, 254, 29),
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 5.0,
                                color: Colors.white,
                              ),
                            ),
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "установить\nфото",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 6.0),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 24,
                          child: Column(
                            children: [
                              Container(
                                width: 0.4 * size.width,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 10.0),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(112, 195, 22, 1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Text(
                                  nick ?? "-",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorsUI.black, fontSize: 11),
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Container(
                                width: 0.4 * size.width,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 10.0),
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(112, 195, 22, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                child: Text(
                                  email ?? "-",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorsUI.black, fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.04 + 6.0,
                          right: 6.0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade600,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0))),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: const Center(
                              child: Text(
                                "ID #1",
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 12.0,
                          right: 6.0,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const SupportScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 370),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade600,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0))),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: const Center(
                                child: Text(
                                  "Связаться с нами",
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(LogOut());
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const AuthScreen(),
                        transitionDuration: const Duration(milliseconds: 370),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 48.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: ColorsUI.red,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        "Log Out",
                        style: textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
