import 'package:flutter/material.dart';

import 'constants/routes.dart';
import 'views/forgot_password_view.dart';
import 'views/login_view.dart';
import 'views/new_password_view.dart';
import 'views/register_view.dart';
import 'views/verification_code_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noor e Tafseer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        forgotPasswordRoute: (context) => const ForgotPasswordView(),
        verificationCodeRoute: (context) => const VerificationCodeView(),
        newPasswordRoute: (context) => const NewPasswordView(),
        registerRoute: (context) => const RegisterView(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}
