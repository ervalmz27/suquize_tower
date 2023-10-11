import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
// import 'package:tower_sequice/view_models/services/splash_services.dart';

class IntroScreenDefault extends StatefulWidget {
  const IntroScreenDefault({Key? key}) : super(key: key);

  @override
  State<IntroScreenDefault> createState() => IntroScreenDefaultState();
}

class IntroScreenDefaultState extends State<IntroScreenDefault> {
  List<ContentConfig> listContentConfig = [];
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          // padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) => {setState(() => isLastPage = index == 2)},
            children: [
              Container(
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/splashscreen01s.png'),
                      Container(
                        //apply margin and padding using Container Widget.
                        padding: const EdgeInsets.all(
                            5), //You can use EdgeInsets like above
                        margin: const EdgeInsets.all(5),
                        child: const Text(
                          'Welcome to',
                          maxLines: 10,
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Image.asset('assets/images/SequisTowerLogo.png'),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(
                            left: 0, bottom: 0, right: 15, top: 5),
                        child: const Divider(
                          height: 20,
                          thickness: 2,
                          indent: 20,
                          endIndent: 0,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(
                            left: 20, bottom: 5, right: 15, top: 0),
                        child: const Text(
                          "Sequis Tower stands uniquely psitioned to not only serve as a landmark that redefines Jakarta's skyline, but to also establish a new urban strategy for the city",
                          style: TextStyle(
                              fontFamily: 'Plus Jakarta',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          maxLines: 5,
                        ),
                      ),
                    ]),
              ),
              Container(
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/splashscreen02s.jpg'),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(
                            left: 20, bottom: 5, right: 15, top: 0),
                        child: const Text(
                          "Sequis Tower is comprised of multiple complementary programs which support each other,as well as surroudind community.",
                          style: TextStyle(
                              fontFamily: 'Plus Jakarta',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          maxLines: 5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(
                            left: 20, bottom: 5, right: 15, top: 0),
                        child: const Text(
                          "The design of the Tower is inspired from the banyan tree with a abundle of four towers, with gardens on the roof featuring typical local plants.",
                          style: TextStyle(
                              fontFamily: 'Plus Jakarta',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          maxLines: 5,
                        ),
                      ),
                    ]),
              ),
              Container(
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/splashscreen03s.jpg'),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 0, right: 20, top: 20),
                        child: Wrap(
                          spacing: 10,
                          children: [
                            Image.asset(
                              'assets/images/award01.png',
                              width: 32,
                              height: 32,
                            ),
                            Container(
                              width: 260,
                              height: 60,
                              child: const Text(
                                  '2018 - The Chicago Athenaeum The international Architecture Award',
                                  textAlign: TextAlign.left),
                            )
                          ],
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        children: [
                          Image.asset(
                            'assets/images/award02.png',
                            width: 32,
                            height: 32,
                          ),
                          Container(
                            width: 260,
                            height: 60,
                            child: const Text(
                                '2017 - Asia Property Awards Best Green Development',
                                textAlign: TextAlign.left),
                          )
                        ],
                      ),
                      Wrap(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetweenr,
                        children: [
                          Image.asset(
                            'assets/images/award03.png',
                            width: 32,
                            height: 32,
                          ),
                          Container(
                            width: 260,
                            height: 60,
                            child: const Text(
                                '2017 - Indonesia Property Awards Best Green Development',
                                textAlign: TextAlign.left),
                          )
                        ],
                      ),
                      Wrap(
                        children: [
                          Image.asset(
                            'assets/images/award04.png',
                            width: 32,
                            height: 32,
                          ),
                          Container(
                            width: 260,
                            height: 60,
                            child: const Text(
                                '2017 - Indonesia Property Awards Best Office Arcitectural Design',
                                textAlign: TextAlign.left),
                          )
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    primary: Colors.white,
                    backgroundColor: Colors.cyan,
                    minimumSize: const Size.fromHeight(70)),
                onPressed: () async {
                  Get.toNamed(RouteName.loginView);
                },
                child: const Text(
                  "GET STARTED",
                  style: TextStyle(fontSize: 16, fontFamily: 'Plus Jakarta'),
                ))
            : Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 80,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.black26),
                    onDotClicked: (index) => controller.animateToPage(index,
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeIn),
                  ),
                ),
              ),
      );
}
