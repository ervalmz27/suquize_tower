import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/view_models/controller/register/register_view_model.dart';
import '../../../utils/utils.dart';

class InputPhoneWidget extends StatelessWidget {
  InputPhoneWidget({Key? key}) : super(key: key);

  final registerVM = Get.put(RegisterViewModel());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: registerVM.phoneController.value,
      focusNode: registerVM.phoneFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('phone', 'Enter Phone');
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(
          context,
          registerVM.emailFocusNode.value,
          registerVM.phoneFocusNode.value,
        );
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          labelStyle: TextStyle(color: Colors.white),
          // hintText: 'Phone'.tr,
          labelText: 'Mobile phone',
          prefixIcon: Icon(
            Icons.phone,
            color: Color.fromARGB(255, 194, 194, 194),
            size: 24.0,
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0))),
    );
  }
}
