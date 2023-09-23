import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor_e_tafseer/components/page_introductory_header.dart';
import 'package:noor_e_tafseer/constants/colors.dart';
import 'package:noor_e_tafseer/widgets/button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../constants/routes.dart';
import '../utils/snackbar.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key});

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  late final TextEditingController textEditingController;

  bool hasError = false;
  String currentText = "";
  String code = "123456";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
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
            const PageIntroductoryHeader(
              icon: FontAwesomeIcons.key,
              title: 'Verification',
              description:
                  'Enter the one time password that was sent to your email.',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 30,
              ),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: const TextStyle(
                  color: AppColors.darkTextColor,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                obscureText: false,
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 6) {
                    return "Incomplete Code";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeColor: AppColors.primaryColor,
                  selectedColor: AppColors.primaryColor,
                  inactiveColor: AppColors.primaryColor,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  return true;
                },
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
                  if (currentText.length != 6 || currentText != code) {
                    setState(() => hasError = true);

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        buildCustomSnackBar(
                          'Oh Snap!',
                          'The verification code you entered doesn\'t match the code we sent you!',
                          ContentType.failure,
                        ),
                      );
                  } else {
                    setState(
                      () {
                        hasError = false;

                        Navigator.of(context).pushNamed(
                          newPasswordRoute,
                        );
                      },
                    );
                  }
                },
                label: 'Verify Code',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
