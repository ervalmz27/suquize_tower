import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/view_models/controller/home/home_view_models.dart';
import 'package:tower_sequice/view_models/controller/profile/profile_view_model.dart';

import '../../../utils/utils.dart';

class InputMobileWidget extends StatelessWidget {
  final profleData = Get.put(HomeController());
  final profle = Get.put(ProfileViewModel());
  final bool isUpdate;

  InputMobileWidget({Key? key, required this.isUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: profle.mobilePhoneController.value,
      focusNode: profle.mobilePhoneFocusNode.value,
      enabled: this.isUpdate,
      style: const TextStyle(color: Colors.grey),
      onFieldSubmitted: (value) {
        // Utils.fieldFocusChange(context, profle.emailFocusNode.value,
        //     profle.passwordFocusNode.value);
      },
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 0, 0, 0)),
        ),
        labelStyle: TextStyle(color: Colors.grey),
        labelText: 'Mobile Phone ',
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0)),
      ),
    );
  }
}
