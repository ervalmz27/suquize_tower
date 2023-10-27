import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/view_models/controller/home/home_view_models.dart';
import 'package:tower_sequice/view_models/controller/profile/profile_view_model.dart';

import '../../../utils/utils.dart';

class InputCompanyFloordWidget extends StatelessWidget {
  InputCompanyFloordWidget({Key? key}) : super(key: key);

  final profileVm = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print(profileVm.userList.value.data);
    return TextFormField(
      initialValue: profileVm.userList.value.data!['floorIds'][0],
      enabled: false,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Email', 'Enter email');
        }
      },
      style: const TextStyle(color: Colors.grey),
      onFieldSubmitted: (value) {
        // Utils.fieldFocusChange(context, profileVm.emailFocusNode.value,
        //     profileVm.passwordFocusNode.value);
      },
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 0, 0, 0)),
        ),
        labelStyle: TextStyle(color: Colors.grey),
        labelText: 'Company Floors ',
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0)),
      ),
    );
  }
}
