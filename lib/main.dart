import 'package:blooddonate/pages/SplashPage.dart';
import 'package:blooddonate/providers/CountryCodeProvider.dart';
import 'package:blooddonate/providers/ShowPassProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ShowPassProvider()),
      ChangeNotifierProvider(create: (_) => CountryCodeProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColor: const Color(0xffC82833),
      ),
      home: SplashPage(),
    );
  }
}
