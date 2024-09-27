import 'package:action_engine/constants/routes.dart';
// import 'package:action_engine/views/home_page.dart';
import 'package:action_engine/views/login_page.dart';
import 'package:action_engine/views/register_page.dart';
import 'package:action_engine/views/test.dart';
import 'package:action_engine/widgets/navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const LoginView(),
    routes: {
      testRoute: (context) => const TestPage(),
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      homeRoute: (context) => const NavigationBarView(),
      // verRoute: (context) => const VerifyEmailView(),
    },
  ));
}
