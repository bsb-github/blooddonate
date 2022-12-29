import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.7,
            ),
            Image.asset(
              "Assets/images/splashLogo.png",
              height: 150,
            ),
            Expanded(child: Container()),
            const CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
            const SizedBox(
              height: 75,
            )
          ],
        ),
      ),
    );
  }
}
