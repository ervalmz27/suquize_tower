import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AccessView extends StatefulWidget {
  const AccessView({super.key});

  @override
  State<AccessView> createState() => _AccessViewState();
}

TabBar get _tabBar => const TabBar(
      labelColor: Colors.cyan,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(
          text: "Turnstile",
        ),
        Tab(
          text: "Door Access",
        ),
      ],
    );

class _AccessViewState extends State<AccessView> {
  final List items = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  var arguments = Get.arguments;
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    print(arguments['cardNumber']);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.cyan,
              bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: Material(
                  color: Colors.white,
                  child: _tabBar,
                ),
              ),
              title: Text('Turnstile Access'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 20.0,
                onPressed: () {
                  Get.back();
                },
              )),
          body: TabBarView(
            children: [
              arguments['cardNumber'] != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: QrImageView(data: arguments['cardNumber']),
                            ),
                          ],
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        Text("You don't have a card number yet!")
                      ],
                    ),
              arguments['cardNumber'] != null
                  ? Center(
                      child: QrImageView(data: arguments['cardNumber']),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        Text("You don't have a card number yet!")
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
