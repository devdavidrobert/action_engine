import 'package:action_engine/constants/app_fonts.dart';
import 'package:action_engine/constants/routes.dart';
import 'package:action_engine/widgets/custom_elevated_button.dart';
import 'package:action_engine/widgets/custom_text_field.dart';
import 'package:action_engine/widgets/frosted_glass.dart';
import 'package:action_engine/widgets/widget_separator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                  height: 300,
                  child: Column(
                    children: [
                      Text(
                        'Action Engine',
                        style: AppFonts.montserratBoldHeader,
                      ),
                      const WidgetSeparator(),
                      const WidgetSeparator(),
                      SizedBox(
                        height: 1.0,
                        child: Container(
                          color: Colors.black38,
                        ),
                      ),
                      const WidgetSeparator(),
                      const WidgetSeparator(),
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
                      SizedBox(
                        height: 1.0,
                        child: Container(
                          color: Colors.black38,
                        ),
                      ),
                      const WidgetSeparator(),
                      //
                      CustomElevatedButton(
                        onPressed: () async {
                          final email = _email.text;
                          final password = _password.text;

                          try {
                            final userCredential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );

                            final user = FirebaseAuth.instance.currentUser;

                            await user?.sendEmailVerification();

                            Navigator.of(context).pushNamedAndRemoveUntil(
                              loginRoute,
                              (route) => false,
                            );
                            devtools.log(userCredential.toString());
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              await showErrorDialog(
                                context,
                                'Weak password',
                              );
                            } else if (e.code == 'invalid-email') {
                              await showErrorDialog(
                                context,
                                'Invalid email',
                              );
                            } else if (e.code == 'email-already-in-use') {
                              await showErrorDialog(
                                  context, 'Email already in use');
                            } else {
                              await showErrorDialog(
                                context,
                                'Error: ${e.code}',
                              );
                            }
                          } catch (e) {
                            await showErrorDialog(
                              context,
                              e.toString(),
                            );
                          }
                        },
                        buttonText: 'Register',
                        btnHeight: 40,
                        btnWidth: 300,
                      ),
                      const WidgetSeparator(),
                      CustomElevatedButton2(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            loginRoute,
                          );
                        },
                        buttonText: 'Login',
                        btnHeight: 40,
                        btnWidth: 300,
                      ),
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
