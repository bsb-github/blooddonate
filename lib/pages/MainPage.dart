import 'package:blooddonate/pages/DonationRequestDetails.dart';
import 'package:blooddonate/pages/HomePage.dart';
import 'package:blooddonate/pages/MessagesPage.dart';
import 'package:blooddonate/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPAge extends StatefulWidget {
  const MainPAge({super.key});

  @override
  State<MainPAge> createState() => _MainPAgeState();
}

class _MainPAgeState extends State<MainPAge> {
  int currentIndex = 0;
  final Pages = [
    HomePage(),
    DonationDetails(),
    MessagesPage(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: Colors.pinkAccent,
          selectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
          selectedIconTheme:
              IconThemeData(color: Theme.of(context).primaryColor),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.donate), label: 'Donate'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.message), label: 'Message'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.person), label: 'Profile'),
          ]),
    );
  }
}
