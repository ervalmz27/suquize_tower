import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:tower_sequice/view/login/widgets/input_email_widget.dart';
import 'package:tower_sequice/view_models/controller/login/login_view_model.dart';

// import '../../data/response/status.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 181, 219),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 70,
          ),
          Container(
            color: Colors.white,
            width: 400,
            child: Image.asset('assets/images/SequisTowerLogo.png'),
          ),
          const SizedBox(
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InputEmailWidget(),
                      const SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have account? ",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Plus Jakarta',
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(RouteName.registerView);
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Plus Jakarta',
                      color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: 60,
          )
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
              loginVM.loginApi();
            }
          },
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 16, fontFamily: 'Plus Jakarta'),
          )),
    );
  }
}
