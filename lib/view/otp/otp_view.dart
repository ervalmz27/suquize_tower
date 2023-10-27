import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:tower_sequice/view_models/controller/otp/otp_view_model.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final otpVM = Get.put(OtpViewModel());
  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Verify PIN'),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Text(
                      "Verification code is being sent to your number.Please enter the verification number here",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Plus Jakarta",
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                  TextButton(
                      onPressed: () {
                        otpVM.resendOtpApi(arguments);
                      },
                      child: const Text(
                        'Resend Code',
                        style: TextStyle(color: Colors.cyan),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 50),
            OTPTextField(
                length: 5,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 45,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  otpVM.otpApi(pin, arguments);
                }),
          ],
        ));
  }
}

    // child: 