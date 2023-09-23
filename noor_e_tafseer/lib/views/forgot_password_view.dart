import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor_e_tafseer/components/page_introductory_header.dart';
import 'package:noor_e_tafseer/widgets/button.dart';
import 'package:noor_e_tafseer/widgets/textfield.dart';

import '../constants/routes.dart';
import '../utils/snackbar.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  String email = "john@gmail.com";
  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set the desired background color
        elevation: 0.0,
        automaticallyImplyLeading: true,
        // Other app bar properties
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PageIntroductoryHeader(
              icon: FontAwesomeIcons.lock,
              title: 'Forget Password',
              description:
                  "Provide your account's email for which you want to reset your password!",
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 30.0,
                right: 30.0,
                bottom: 12.0,
              ),
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
                left: 30.0,
                right: 30.0,
                bottom: 12.0,
              ),
              child: CustomButton(
                onPressed: () async {
                  if (email == _email.text) {
                    Navigator.of(context).pushNamed(
                      verificationCodeRoute,
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        buildCustomSnackBar(
                          'Oh Snap!',
                          'You entered an incorrect email!',
                          ContentType.failure,
                        ),
                      );
                  }
                },
                label: 'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
