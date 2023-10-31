import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:tower_sequice/view/register/widgets/acces_token_widget.dart';
import 'package:tower_sequice/view/register/widgets/input_email_widget.dart';
import 'package:tower_sequice/view/register/widgets/input_phone_widget.dart';
import 'package:tower_sequice/view_models/controller/login/login_view_model.dart';
import 'package:tower_sequice/view_models/controller/register/register_view_model.dart';

// import '../../data/response/status.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();
  final registerVM = Get.put(RegisterViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 181, 219),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            width: 400,
            child: Image.asset('assets/images/SequisTowerLogo.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      // Image.asset('assets/images/SequisTowerLogo.png'),
                      const SizedBox(
                        height: 100,
                      ),
                      InputEmailWidget(),
                      InputPhoneWidget(),
                      InputAccessWidget(),
                      const SizedBox(
                        height: 90,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.toNamed(RouteName.loginView);
                              Get.delete<RegisterViewModel>();
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Plus Jakarta',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              primary: Colors.cyan,
              backgroundColor: Colors.white,
              minimumSize: const Size.fromHeight(70)),
          onPressed: () async {
            if (_formkey.currentState!.validate()) {
              registerVM.registerApi();
            }
          },
          child: const Text(
            "Register",
            style: TextStyle(fontSize: 16, fontFamily: 'Plus Jakarta'),
          )),
    );
  }
}
