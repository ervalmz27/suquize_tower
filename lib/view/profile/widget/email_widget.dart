import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/view_models/controller/home/home_view_models.dart';
import 'package:tower_sequice/view_models/controller/profile/profile_view_model.dart';

class InputEmailProfileWidget extends StatelessWidget {
  InputEmailProfileWidget({Key? key}) : super(key: key);

  final loginVM = Get.put(ProfileViewModel());
  final profle = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: loginVM.emailController.value,
      // focusNode: loginVM.emailFocusNode.value,
      initialValue: profle.userList.value.data!['email'],
      enabled: false,
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
        labelText: 'Email ',
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0)),
      ),
    );
  }
}
