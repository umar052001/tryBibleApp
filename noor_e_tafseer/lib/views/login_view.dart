import 'package:flutter/material.dart';
import 'package:noor_e_tafseer/components/or_divider.dart';
import 'package:noor_e_tafseer/components/other_login_methods.dart';
import 'package:noor_e_tafseer/components/welcome_top_container.dart';
import 'package:noor_e_tafseer/widgets/button.dart';
import 'package:noor_e_tafseer/widgets/textfield.dart';

import '../constants/colors.dart';
import '../constants/routes.dart';
import '../widgets/text_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email = "john@gmail.com";
  String password = "john123";

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
      backgroundColor: AppColors.darkBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopContainer(text1: "Welcome back", text2: "Please login"),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                border: Border.all(
                  color: const Color(0xFFE1EFFE),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14.0, left: 7.0, right: 7.0, bottom: 0.0),
                      child: CustomTextField(
                        controller: _email,
                        obscureText: false,
                        autocorrect: false,
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14.0, left: 7.0, right: 7.0, bottom: 0.0),
                      child: CustomTextField(
                        controller: _password,
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                        keyboardType: TextInputType.text,
                        hintText: 'Password',
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, right: 15.0),
                        child: CustomTextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              forgotPasswordRoute,
                            );
                          },
                          text: const Text(
                            "Forgot password?",
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF2A2A2A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 8.0, right: 8.0, bottom: 12.0),
                      child: CustomButton(
                        onPressed: () async {
                          if (email == _email.text &&
                              password == _password.text) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              homeRoute,
                              (route) => false,
                            );
                          } else {
                            //give error message
                          }
                        },
                        label: 'Login',
                      ),
                    ),
                    const OrDivider(),
                    const SizedBox(height: 8.0),
                    const OtherLoginMethods(),
                    Padding(
                      padding: const EdgeInsets.only(top: 70.0, bottom: 14.0),
                      child: CustomTextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            registerRoute,
                            (route) => false,
                          );
                        },
                        text: const Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                color: AppColors.darkTextColor,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                text: "Sign up!",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
