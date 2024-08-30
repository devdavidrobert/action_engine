import 'package:action_engine/constants/routes.dart';
import 'package:action_engine/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 48),
              child: SizedBox(
                height: 240,
                width: 200,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Action Engine',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: false,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        icon: Icon(
                          Icons.email_rounded,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _password,
                      obscureText: true,
                      enableSuggestions: false,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        icon: Icon(
                          Icons.password,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {
                          final email = _email;
                          final password = _password;
                          await Firebase.initializeApp(
                              options: DefaultFirebaseOptions.currentPlatform);
                          try {
                            final userCredentials = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );
                            final isEmailVerified =
                                userCredentials.user?.emailVerified;
                            if (isEmailVerified == false) {
                              await Navigator.of(context)
                                  .pushNamedAndRemoveUntil(
                                homeRoute,
                                (route) => false,
                              );
                              print(userCredentials);
                            }
                            print(userCredentials);
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                        child: const Text(
                          'Login',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            registerRoute, (route) => false);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
