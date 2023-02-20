import 'package:blooddonate/Modals/LocationModal.dart';
import 'package:blooddonate/Modals/UserModel.dart';
import 'package:blooddonate/Widgets/MyAppBar.dart';
import 'package:blooddonate/pages/HomePage.dart';
import 'package:blooddonate/pages/ProfilePage.dart';
import 'package:blooddonate/providers/CountryCodeProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';

class DonationRequest extends StatefulWidget {
  const DonationRequest({super.key});

  @override
  State<DonationRequest> createState() => _DonationRequestState();
}

class _DonationRequestState extends State<DonationRequest> {
  int _stackIndex = 0;

  String _singleValue = "Text alignment right";
  String selected = "A+";

  final _status = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O-", "O+"];
  final typeRequest = ["Request", "Emergency"];
  String applcationType = "Request";

  final _hospNameController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            "Donation Request",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("Enter Hospital"),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                child: TextFormField(
                  controller: _hospNameController,
                  decoration: InputDecoration(
                    hintText: "Enter Hospital",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("Blood Group"),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DropdownSearch(
                items: _status,
                selectedItem: _status[0],
                onChanged: (value) {
                  setState(() {
                    selected = value.toString();
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("When you need Blood?"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownSearch(
                popupProps: PopupProps.menu(
                    constraints: BoxConstraints(maxHeight: 120)),
                items: typeRequest,
                onChanged: (value) {
                  setState(() {
                    applcationType = value.toString();
                  });
                },
                selectedItem: typeRequest[0],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                maxLines: 10,
                controller: _noteController,
                decoration: InputDecoration(
                  hintText: "Note",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      "Cancel",
                      style: TextStyle(color: Color(0xffC82833)),
                    )),
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFAC8C8),
                      border: Border.all(color: Color(0xffC82833)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Consumer(
                  builder: (context, value, child) => InkWell(
                    onTap: () async {
                      var user = UserDataList.usersList[0];
                      UserPosition.determinePosition().then((value) {
                        Provider.of<CountryCodeProvider>(context, listen: false)
                            .setLoc(value.longitude, value.latitude);
                      });
                      await FirebaseFirestore.instance
                          .collection("Posts")
                          .doc()
                          .set({
                        "address": _hospNameController.text,
                        "application_type": applcationType,
                        "blood_type": selected,
                        "contact": user.contact,
                        "details": _noteController.text == ""
                            ? "Required $selected Blood $applcationType"
                            : _noteController.text,
                        "name": user.name,
                        "time_posted": DateTime.now(),
                        "user_id": user.uid,
                        "longitude": Provider.of<CountryCodeProvider>(context,
                                listen: false)
                            .longi,
                        "latitude": Provider.of<CountryCodeProvider>(context,
                                listen: false)
                            .lat,
                      }).then((value) {
                        Get.snackbar("Request Sent",
                            "Request for $selected Blood has been placed",
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Theme.of(context).primaryColor);
                        Get.to(HomePage());
                      });
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        "Send Request",
                        style: TextStyle(color: Colors.white),
                      )),
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffC82833),
                        border: Border.all(color: Color(0xffC82833)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
