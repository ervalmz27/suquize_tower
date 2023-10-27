import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/view_models/controller/home/home_view_models.dart';
import 'package:tower_sequice/view_models/controller/profile/profile_view_model.dart';

import '../../../utils/utils.dart';

class InputCompanyNameWidget extends StatelessWidget {
  InputCompanyNameWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(ProfileViewModel());
  final profileVm = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: profileVm.userList.value.data!['tenant']['name'],
      enabled: false,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Email', 'Enter email');
        }
      },
      style: const TextStyle(color: Colors.grey),
      onFieldSubmitted: (value) {
        // Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
        //     loginVM.passwordFocusNode.value);
      },
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 0, 0, 0)),
        ),
        labelStyle: TextStyle(color: Colors.grey),
        labelText: 'Company Name ',
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0)),
      ),
    );
  }
}
