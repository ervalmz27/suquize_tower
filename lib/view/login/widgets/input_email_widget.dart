import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Email', 'Enter email');
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
            loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
              width: 1, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        hintText: 'Email or Mobile Phone'.tr,
        prefixIcon: const Icon(
          Icons.email,
          color: Color.fromARGB(255, 194, 194, 194),
          size: 24.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.0)),
      ),
    );
  }
}
