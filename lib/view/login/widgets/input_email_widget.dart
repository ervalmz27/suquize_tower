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
      // textInputAction: TextInputAction.go,
      textInputAction: TextInputAction.go,
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email | number phone';
        }
        return null;
      },
      style: const TextStyle(color: Colors.white),
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
            loginVM.passwordFocusNode.value);
        loginVM.loginApi();
      },

      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        labelStyle: TextStyle(color: Colors.white),
        labelText: 'Email or Mobile Phone',
        prefixIcon: Icon(
          Icons.email,
          color: Color.fromARGB(255, 194, 194, 194),
          size: 24.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0)),
      ),
    );
  }
}
