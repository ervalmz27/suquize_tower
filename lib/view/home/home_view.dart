import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:tower_sequice/view/access/access_view.dart';
import 'package:tower_sequice/view_models/controller/home/home_view_models.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();

    homeController.userListApi();
  }

  final List<Map<String, dynamic>> items = [
    {"title": "Profile ", "url": "assets/images/menuprofile.svg"},
    {"title": "Access", "url": "assets/images/menuQR.svg"},
    {"title": "Bulletin", "url": "assets/images/menubulletin.svg"},
    {"title": "Facility Management", "url": "assets/images/menusdx.svg"},
    {"title": "Wallness", "url": "assets/images/menuwellness.svg"},
    {"title": "Food", "url": "assets/images/menufb.svg"},
    {"title": "GSG Menu", "url": "assets/images/menugsg.svg"},
    {"title": "Settings", "url": "assets/images/menusetting.svg"},
  ].toList();
  final List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/SequisTowerLogo.png',
              height: 26,
            ),
            homeController.userList.value.data != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi,',
                        style: TextStyle(color: Colors.black),
                      ),
                      InkWell(
                        child: Text(
                          homeController.userList.value.data!['firstName'] +
                              homeController.userList.value.data!['lastName'],
                          style: TextStyle(
                            color: Colors.cyan,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(RouteName.profileView);
                        },
                      )
                    ],
                  )
                : Text(""),
          ],
        ),
      ),
      body: Flex(direction: Axis.vertical, children: [
        Container(
          color: Colors.cyan,
          width: 400,
          height: 150,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              itemBuilder: (context, pagePosition) {
                return Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/splashscreen03s.jpg',
                    ));
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(children: [
            GridView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1.1),
                itemBuilder: (context, index) {
                  final map = items[index];
                  final title = map["title"];
                  final url = map["url"];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Get.toNamed(RouteName.profileView);
                          } else if (index == 1) {
                            Get.to(() => const AccessView(),
                                arguments: homeController.userList.value.data!);
                          }
                        },
                        child: Container(
                            height: 90,
                            width: 90,
                            padding: const EdgeInsets.all(4.0),
                            child: SvgPicture.asset(url)),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                            fontFamily: "Plus Jakarta", fontSize: 8),
                      ),
                    ],
                  );
                })
          ]),
        )
      ]),
    );
  }
}
