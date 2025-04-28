import 'package:flutter/material.dart';
import 'package:grabber_app/views/home_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "SplashView";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, HomeView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/Grabber.png",
        ),
      ),
    );
  }
}
