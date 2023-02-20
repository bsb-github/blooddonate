import 'dart:ui';

import 'package:blooddonate/pages/HomePage.dart';
import 'package:blooddonate/pages/MainPage.dart';
import 'package:blooddonate/pages/SignInPage.dart';
import 'package:blooddonate/providers/CountryCodeProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Modals/UserModel.dart';
import '../providers/ShowPassProvider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _cnfrmPassController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  // create a form key
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).primaryColor,
            body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.aBeeZee().fontFamily,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.82 - 1,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(FontAwesomeIcons.user),
                                  hintText: "User name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Consumer(
                              builder: (context, child, widget) =>
                                  TextFormField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                    prefixIcon: GestureDetector(
                                      onTap: () {
                                        showCountryPicker(
                                            context: context,
                                            onSelect: (value) {
                                              context
                                                  .read<CountryCodeProvider>()
                                                  .setCountryCode(
                                                      value.phoneCode);
                                            });
                                      },
                                      child: Container(
                                        height: 3,
                                        width: 3,
                                        child: Center(
                                          child: Text(
                                            context
                                                .watch<CountryCodeProvider>()
                                                .countryCode,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    hintText: "Phone number",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _addressController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.home),
                                  hintText: "Address",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                } else if (!regex.hasMatch(value)) {
                                  return "choose more secure password";
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        context
                                            .read<ShowPassProvider>()
                                            .changeShowPassSignUpState();
                                      },
                                      icon: !context
                                              .watch<ShowPassProvider>()
                                              .showPassSignUp
                                          ? const Icon(
                                              Icons.visibility_outlined)
                                          : const Icon(
                                              Icons.visibility_off_outlined)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _cnfrmPassController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                } else if (_cnfrmPassController.text !=
                                    _passController.text) {
                                  return "Password donot match";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        context
                                            .read<ShowPassProvider>()
                                            .change_ShowPassSignUpState();
                                      },
                                      icon: !context
                                              .watch<ShowPassProvider>()
                                              .showPassPage
                                          ? const Icon(
                                              Icons.visibility_outlined)
                                          : const Icon(
                                              Icons.visibility_off_outlined)),
                                  hintText: "Confirm password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  registerUser(
                                      email: _emailController.text,
                                      password: _cnfrmPassController.text,
                                      name: _nameController.text,
                                      phone: _phoneController.text,
                                      address: _addressController.text);
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "or continue with",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "Assets/images/logo_google.png",
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  "Assets/images/logo_fb.png",
                                  height: 30,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily:
                                        GoogleFonts.aBeeZee().fontFamily,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => const SignInPage());
                                  },
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily:
                                          GoogleFonts.aBeeZee().fontFamily,
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void registerUser(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address}) async {
    var uid = "";
    try {
      Get.snackbar("Please Wait", "Creating Your Account",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        setState(() {
          uid = value.user!.uid;
        });
        await FirebaseFirestore.instance
            .collection("UserData")
            .doc(value.user!.uid)
            .set({
          "uid": value.user!.uid,
          "name": name,
          "email": email,
          "address": address,
          "contact": Provider.of<CountryCodeProvider>(context, listen: false)
                  .countryCode +
              phone,
        }).then((value) {
          Get.snackbar("Success", "Account Create Successfully",
              colorText: Colors.white,
              backgroundColor: Colors.green,
              snackPosition: SnackPosition.BOTTOM);
          UserDataList.usersList.add(UserModal(
              name: name,
              email: email,
              address: address,
              uid: uid,
              contact: Provider.of<CountryCodeProvider>(context, listen: false)
                      .countryCode +
                  phone));
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainPAge(),
              ));
        });
      });
    } catch (Exception) {
      Get.snackbar("Error", "Account cannot be created",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
