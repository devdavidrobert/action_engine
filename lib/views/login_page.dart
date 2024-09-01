import 'package:action_engine/constants/routes.dart';
import 'package:action_engine/widgets/custom_elevated_button.dart';
import 'package:action_engine/widgets/custom_text_field.dart';
import 'package:action_engine/widgets/frosted_glass.dart';
import 'package:action_engine/widgets/widget_separator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../utilities/show_error_dialog.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/illustration.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FrostedGlassBox(
            theChild: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        height: 40,
                        isObscureText: false,
                        hintText: 'Enter Your Email',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      const WidgetSeparator(),
                      CustomTextField(
                        controller: _password,
                        keyboardType: TextInputType.emailAddress,
                        height: 40,
                        isObscureText: true,
                        hintText: 'Enter Your password',
                        prefixIcon: const Icon(Icons.password_outlined),
                      ),
                      const WidgetSeparator(),
                      const WidgetSeparator(),
                      //login button
                      CustomElevatedButton(
                        onPressed: () async {
                          final email = _email.text;
                          final password = _password.text;
                          try {
                            final userCredential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              homeRoute,
                              (route) => false,
                            );
                            devtools.log(userCredential.toString());
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'invalid-credential') {
                              await showErrorDialog(
                                context,
                                'Wrong credentials',
                              );
                            } else if (e.code == 'network-request-failed') {
                              await showErrorDialog(
                                context,
                                'No network connectivity',
                              );
                            } else if (e.code == 'invalid-email') {
                              await showErrorDialog(
                                context,
                                'Invalid Email',
                              );
                            } else {
                              await showErrorDialog(
                                context,
                                'Error: ${e.code}',
                              );
                            }
                          } catch (e) {
                            {
                              await showErrorDialog(
                                context,
                                e.toString(),
                              );
                            }
                          }
                        },
                        buttonText: 'Login',
                        btnHeight: 40,
                        btnWidth: 300,
                      ),
                      const WidgetSeparator(),
                      CustomElevatedButton2(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            registerRoute,
                            (route) => false,
                          );
                        },
                        buttonText: 'Register',
                        btnHeight: 40,
                        btnWidth: 300,
                      )
                    ],
                  ),
                ),
              ),
            ),
            theWidth: 300,
            theHeight: 500,
          ),
        ),
      ),
    );
  }
}
