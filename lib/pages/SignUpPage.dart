import 'dart:ui';

import 'package:blooddonate/pages/SignInPage.dart';
import 'package:blooddonate/providers/CountryCodeProvider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/ShowPassProvider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          Consumer(
                            builder: (context, child, widget) => TextFormField(
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
                                            color:
                                                Theme.of(context).primaryColor,
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
                            height: 30,
                          ),
                          TextFormField(
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
                                        ? const Icon(Icons.visibility_outlined)
                                        : const Icon(
                                            Icons.visibility_off_outlined)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
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
                                        ? const Icon(Icons.visibility_outlined)
                                        : const Icon(
                                            Icons.visibility_off_outlined)),
                                hintText: "Confirm password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {},
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
                                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
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
    );
  }
}
