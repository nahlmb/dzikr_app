import 'package:dzikr_app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? "assets/images/im_dzikr_logo_white.png"
              : "assets/images/im_dzikr_logo.png",
          width: (MediaQuery.of(context).size.width > 260)
              ? 170
              : MediaQuery.of(context).size.width * 0.6,
        ),
      ),
    );
  }
}
