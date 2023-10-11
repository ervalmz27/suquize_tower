import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/view_models/controller/register/register_view_model.dart';
import '../../../utils/utils.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({Key? key}) : super(key: key);

  final registerVM = Get.put(RegisterViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: registerVM.emailController.value,
      focusNode: registerVM.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Email', 'Enter email');
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(
          context,
          registerVM.emailFocusNode.value,
          registerVM.phoneFocusNode.value,
        );
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          // hintText: 'Email'.tr,
          labelText: 'Email',
          prefixIcon: const Icon(
            Icons.email,
            color: Color.fromARGB(255, 194, 194, 194),
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          labelStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
            color: Colors.white,
            width: 1.0,
          ))),
    );
  }
}
