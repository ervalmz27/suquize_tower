import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/data/response/status.dart';
import 'package:tower_sequice/res/components/general_exception.dart';
import 'package:tower_sequice/res/components/internet_exceptions_widget.dart';
import 'package:tower_sequice/view/profile/widget/company_floor_widget.dart';
import 'package:tower_sequice/view/profile/widget/company_name_widget.dart';
import 'package:tower_sequice/view/profile/widget/email_widget.dart';
import 'package:tower_sequice/view/profile/widget/mobile_widget.dart';
import 'package:tower_sequice/view_models/controller/home/home_view_models.dart';
import 'package:tower_sequice/view_models/controller/profile/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final profileController = Get.put(ProfileViewModel());
  final homeController = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    profileController.getProfile();
  }

  bool _isUpdate = false;
  String textUpt = "Update";
  String textCancel = "Cancel";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            const Text(
              "Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Plus Jakarta",
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _isUpdate = !_isUpdate;
                  });
                },
                child: Text(
                  _isUpdate ? textCancel : textUpt,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Plus Jakarta",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ))
          ],
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (homeController.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {
                  homeController.refreshApi();
                },
              );
            } else {
              return GeneralExceptionWidget(onPress: () {
                homeController.refreshApi();
              });
            }
          case Status.COMPLETED:
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _isUpdate
                      ? const Padding(
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Color(0xFFB2EBF2),
                              radius: 60,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/rames.png'),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 32,
                                ),
                              ),
                            ),
                          ))
                      : const Padding(
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Color(0xFFB2EBF2),
                              radius: 60,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/rames.png'),
                              ),
                            ),
                          )),
                  const Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Account Details",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontFamily: 'Plus Jakarta',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                      child: Container(
                    decoration: BoxDecoration(),
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: TextFormField(
                            enabled: false,
                            initialValue: homeController
                                .userList.value.data!['firstName'],
                            readOnly: true,
                            decoration: const InputDecoration(
                              hintText: '',
                              labelText: 'Firstname',
                            ),
                          ),
                        ),
                        Flexible(
                          child: TextFormField(
                            initialValue:
                                homeController.userList.value.data!['lastName'],
                            readOnly: true,
                            enabled: false,
                            enableInteractiveSelection: _isUpdate,
                            decoration: const InputDecoration(
                              hintText: '',
                              labelText: 'Lastname',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: InputEmailProfileWidget(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: InputMobileWidget(
                      isUpdate: _isUpdate,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Company Details",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontFamily: 'Plus Jakarta',
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: InputCompanyNameWidget(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: InputCompanyFloordWidget(),
                  ),
                ]);
        }
      }),
      bottomSheet: _isUpdate
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  primary: Colors.white,
                  backgroundColor: Colors.cyan,
                  minimumSize: const Size.fromHeight(70)),
              onPressed: () async {},
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 16, fontFamily: 'Plus Jakarta'),
              ))
          : null,
    );
  }
}
