// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:blooddonate/pages/DonarDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DonationDetails extends StatefulWidget {
  const DonationDetails({super.key});

  @override
  State<DonationDetails> createState() => _DonationDetailsState();
}

class _DonationDetailsState extends State<DonationDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Donation Request",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Image(
                height: 360,
                width: 400,
                image: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/55d8/30c5/a6942a8270096af321b343e25e9f7b4d?Expires=1676246400&Signature=q7XwKsEQDVR5fvC3mLUSHMHhksdiFYPpMVA2KO8sWon1he5PFb5XGHV4~6kzlcNXDGvQgjBhVOUgqSbBrPFHv-NwxhNJI1kj69zdjZRlTxNGSSDNqa8HZvVn32Dnf0SfBI94g4OuCrTdGE8vFjKPdSJmb-u-WTFzCe1k~FQl8yFSTCOFiFCJpy-OwdGmJ-mwkWTgT3roa5E2FXSHp8CM9jT2rg6f6FIyCCGHXIpXbNFMNc2ETLjaCE2kr2mluzxZbDABI0pEGubM0tsEMWcLgS149QoEifvt~LLroLiFQehhIVCZz6-ots-sYdo-CrNnw~q8pgd8IFA1VhRZFXjHsg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("Lor M Telku Kura"),
                SizedBox(
                  width: 100,
                ),
                Text("Blood Group :"),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: Text(
                      "A+",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xffFAC8C8),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text("Ali Ahmed"),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 40, top: 10),
                child: Text(
                  "00947329",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/7d4c/0a85/28b1876e9ee8406ec97a5f6582d45c00?Expires=1676246400&Signature=TPSANIinY8II3x3tNAZqpCA0~N5ldhkuS52Vj9jT2fMRZJ1o~lS8bUumNz3foWfaRGRJW~Dq~cFDkm6b5TMlsuEgBKBGRNbag29ug3qy25RZd12a-S0jUNeYr6NaNqIfRCKcXkl3t686qhGwxRptll-eLWvZNzTfjkFvGgu4SKxXafMwOtRGkZjWtDxVSoMl0PLYvcl0ihhSFGEjppPHSJTwrHB76e2efOXn1wa257ei1lSFPqcz4H7C-mIe3TKTFFBnXUxaTri3z5k4QEIDXYFErIEO8mKdPWWGvjnTWbwEh30NIqpHqQpIFbp-saWzMiGiObqYM6QMvcbK1XvB~w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                    "I need a blood for dolor sit amet, consectetur adipiscig elit Consetur elit hac quisque habitant dictum gravida congue sit Pretium quisque rutrum mattis in"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonarDetails(),
                    ));
              },
              child: Container(
                height: 35,
                width: 120,
                child: Center(
                  child: Text(
                    "Donate Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffC82833),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
