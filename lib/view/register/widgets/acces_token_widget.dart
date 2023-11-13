import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/view_models/controller/register/register_view_model.dart';

class InputAccessWidget extends StatelessWidget {
  InputAccessWidget({Key? key}) : super(key: key);

  final registerVM = Get.put(RegisterViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: registerVM.tokenController.value,
      focusNode: registerVM.tokenFocusNode.value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your access token';
        }
        return null;
      },
      onFieldSubmitted: (value) {
        registerVM.registerApi();
      },
      decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          labelText: 'Access Token',
          prefixIcon: Icon(
            Icons.key,
            color: Color.fromARGB(255, 194, 194, 194),
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          labelStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ))),
    );
  }
}
