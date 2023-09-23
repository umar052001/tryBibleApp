import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor_e_tafseer/widgets/button.dart';

import '../constants/routes.dart';
import '../utils/snackbar.dart';
import '../widgets/textfield.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  String password = "john123";
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;

  @override
  void initState() {
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 50.0,
              ),
              child: FaIcon(
                FontAwesomeIcons.lockOpen,
                size: 60,
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              child: Text(
                "New Password",
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontFamily: 'SF Pro Display',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                left: 30.0,
                right: 30.0,
                bottom: 20.0,
              ),
              child: Text(
                "Your identity has been verified!\nSet your new password.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontFamily: 'SF Pro Display',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 30.0,
                right: 30.0,
                bottom: 12.0,
              ),
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
                left: 30.0,
                right: 30.0,
                bottom: 12.0,
              ),
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
                left: 30.0,
                right: 30.0,
                bottom: 12.0,
              ),
              child: CustomButton(
                onPressed: () async {
                  if (_password.text == password) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        buildCustomSnackBar(
                          'Oh Snap!',
                          'You entered a password that matches your current password!',
                          ContentType.failure,
                        ),
                      );
                  } else if (_password.text != _confirmPassword.text) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        buildCustomSnackBar(
                          'Oh Snap!',
                          'Password and Confirm Password should be same.',
                          ContentType.failure,
                        ),
                      );
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        buildCustomSnackBar(
                          'Success!',
                          'Your password has been successfully reset.',
                          ContentType.success,
                        ),
                      );

                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (route) => false,
                    );
                  }
                },
                label: 'Update',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
