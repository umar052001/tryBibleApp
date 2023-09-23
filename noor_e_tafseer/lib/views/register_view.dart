import 'package:flutter/material.dart';
import 'package:noor_e_tafseer/components/welcome_top_container.dart';

import '../constants/colors.dart';
import '../constants/routes.dart';
import '../widgets/button.dart';
import '../widgets/text_button.dart';
import '../widgets/textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopContainer(
                text1: "Welcome to Noor e Tafseer", text2: "Please signup"),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF), // Set the background color
                border: Border.all(
                  color: const Color(0xFFE1EFFE), // Set the border color
                  width: 1, // Set the border width
                ),
                borderRadius: const BorderRadius.only(
                  topLeft:
                      Radius.circular(35.0), // Set border radius on top left
                  topRight:
                      Radius.circular(35.0), // Set border radius on top right
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
                        controller: _name,
                        obscureText: false,
                        autocorrect: true,
                        enableSuggestions: true,
                        keyboardType: TextInputType.text,
                        hintText: 'Name',
                      ),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14.0, left: 7.0, right: 7.0, bottom: 0.0),
                      child: CustomTextField(
                        controller: _confirmPassword,
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                        keyboardType: TextInputType.text,
                        hintText: 'Confirm Password',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 8.0, right: 8.0, bottom: 12.0),
                      child: CustomButton(
                        onPressed: () async {},
                        label: 'Signup',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 210.0),
                      child: CustomTextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            loginRoute,
                            (route) => false,
                          );
                        },
                        text: const Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                                color: AppColors.darkTextColor,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                text: "Login!",
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
