import 'package:action_engine/constants/routes.dart';
import 'package:action_engine/views/home_page.dart';
import 'package:action_engine/views/login_page.dart';
import 'package:action_engine/views/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Action Engine',
      home: const LoginView(),
      routes: {
        homeRoute: (context) => const HomePage(), // Removed the trailing '/'
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
      },
    ),
  );
}
