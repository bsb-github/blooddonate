// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:blooddonate/Widgets/MyAppBar.dart';
import 'package:blooddonate/Widgets/RequestWidget.dart';
import 'package:blooddonate/pages/DonationRequestPage.dart';
import 'package:blooddonate/pages/LatestRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(DonationRequest());
            },
            backgroundColor: Theme.of(context).primaryColor,
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAppBar(),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.format_list_bulleted_sharp),
                            onPressed: () {},
                          ),
                          hintText: "Active Donors, Blood Group",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: BorderSide(color: Color(0xffD9D9D9))),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Emergency",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("See all"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  RequestCard(),
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   elevation: 10,
                  //   child: Container(
                  //     child: Row(
                  //       children: [
                  //         Column(
                  //           children: [
                  //             Padding(
                  //               padding:
                  //                   const EdgeInsets.only(left: 30, bottom: 10),
                  //               child: Image(
                  //                   height: 50,
                  //                   image: NetworkImage(
                  //                       "https://s3-alpha-sig.figma.com/img/ca84/37d0/c04ce7f5d83d6aaa78c7c30b7f150004?Expires=1676246400&Signature=gf5DVtfKxacfKM-cTpPMTb5KfA8QzMBpzryfarDPNxpSOPNNsyrUbp5f2kRj18n4-mH0PlthHwEvTh3l85zoOzuyQJXf5yteNkSxgyhd~QubET4pkRidQTbQ05f5BVwPAAf6c9Z6RqB9-Tp8MkEyEB~uVlsrc~nGiq-9pH0XRAyivItDcrnXI0tdFKMDAKFCh0VOsrrz2~zf166LtwZkAiYEayVGrh8OHL5jsP753sGKmgCXaAO0-YleDwks0naDruH1DzCXHaXuifGD9CAUOXnPorWzbeAza2LLNgo5uvJMDrByfzdfbhSuGR4H2zCBlg9is27Aft5bnKTxwgdrcA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
                  //             ),
                  //           ],
                  //         ),
                  //         Column(
                  //           children: [
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Container(
                  //                   width: 54,
                  //                   decoration: BoxDecoration(
                  //                       color: Colors.red,
                  //                       borderRadius: BorderRadius.only(
                  //                           bottomLeft: Radius.circular(10))),
                  //                   margin: EdgeInsets.only(left: 250),
                  //                   child: Center(
                  //                     child: Text(
                  //                       "Urgent",
                  //                       style: TextStyle(color: Colors.white),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.only(right: 170),
                  //                   child: Text(
                  //                     "Umer Ali",
                  //                     style: TextStyle(fontWeight: FontWeight.bold),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             SizedBox(
                  //               height: 5,
                  //             ),
                  //             Row(
                  //               children: [
                  //                 Icon(
                  //                   Icons.bloodtype,
                  //                   color: Colors.red,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 10,
                  //                 ),
                  //                 Text("Al-Shifa Hospital, Attock Cantt"),
                  //               ],
                  //             ),
                  //             SizedBox(
                  //               height: 5,
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.only(right: 50),
                  //               child: Row(
                  //                 children: [
                  //                   Icon(
                  //                     Icons.refresh_sharp,
                  //                     color: Colors.red,
                  //                   ),
                  //                   SizedBox(
                  //                     width: 10,
                  //                   ),
                  //                   Text("Requested 10 min ago"),
                  //                 ],
                  //               ),
                  //             ),
                  //             Column(
                  //               children: [
                  //                 /// Divider(),
                  //                 Row(
                  //                   // /rt,
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Text(
                  //                       "Decline",
                  //                       style: TextStyle(color: Colors.red),
                  //                     ),
                  //                     SizedBox(
                  //                       //width: 150,
                  //                       height: 20,
                  //                       child: VerticalDivider(
                  //                         color: Colors.black,
                  //                       ),
                  //                     ),
                  //                     Text(
                  //                       "Donate Now",
                  //                       style: TextStyle(
                  //                           color: Colors.red,
                  //                           fontWeight: FontWeight.bold),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Services",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  // for two containers
                  Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 10,
                        child: Container(
                          width: 180,
                          height: 108,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.bloodtype_sharp,
                                color: Colors.red,
                                size: 50,
                              ),
                              Text("Request for Blood"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 10,
                        child: Container(
                          width: 180,
                          height: 108,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.monitor_heart_sharp,
                                color: Colors.red,
                                size: 50,
                              ),
                              Text("Donate Blood"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Next Appointment",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image(
                              height: 100,
                              width: 100,
                              image: NetworkImage(
                                  "https://s3-alpha-sig.figma.com/img/f42e/24f6/80495f5d616e07bd0cbe54342d93b129?Expires=1676246400&Signature=oxfGcz4HdanL7rwu6mq4L~lnPYwemvyKUeCC6ZcEEJisTWOfcNGFG8HSh5qoB3426mQ5qnZIQXN-heviWhUH92EpvY76qD57h2iQU6xSe6ZVxaorUnt8wjnuPMAoVdySY-8KkxnNTbOwF-cC2ukEgt53pWDVwgHwEj~7E0c2JW6XbIjmgLpF6N1RPxm10P2-i9LPM3W7HTMjRFcNkzp7-KgWxOknFU0egN-wMN4eBP~1cQMn09tREOS-zJDxkgUUe87VpoZuVE4bwhIs0jgnuHfwm9WzWHXHV7dvXyAJgUcqZkNLAEuuAq5DkV413O5q~1eont3S6GQoshbqXiBpEg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Al Shifa Hospital Attock Cantt"),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("12 Dec, 2022"),
                                SizedBox(
                                  width: 30,
                                ),
                                Icon(
                                  Icons.timer,
                                  color: Colors.red,
                                ),
                                Text("9:50 pm"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Latest Request",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("See all"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              height: 60,
                              image: NetworkImage(
                                  "https://s3-alpha-sig.figma.com/img/ca84/37d0/c04ce7f5d83d6aaa78c7c30b7f150004?Expires=1676246400&Signature=gf5DVtfKxacfKM-cTpPMTb5KfA8QzMBpzryfarDPNxpSOPNNsyrUbp5f2kRj18n4-mH0PlthHwEvTh3l85zoOzuyQJXf5yteNkSxgyhd~QubET4pkRidQTbQ05f5BVwPAAf6c9Z6RqB9-Tp8MkEyEB~uVlsrc~nGiq-9pH0XRAyivItDcrnXI0tdFKMDAKFCh0VOsrrz2~zf166LtwZkAiYEayVGrh8OHL5jsP753sGKmgCXaAO0-YleDwks0naDruH1DzCXHaXuifGD9CAUOXnPorWzbeAza2LLNgo5uvJMDrByfzdfbhSuGR4H2zCBlg9is27Aft5bnKTxwgdrcA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "GovinRaj",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Al Shifa Hospital Attock Cantt"),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    LatestRequest())));
                                      },
                                      icon: Icon(
                                        Icons.refresh,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Requested 10 min ago"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
