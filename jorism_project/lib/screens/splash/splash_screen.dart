
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:jorism_project/registration/login/login_screen.dart';
import 'package:jorism_project/screens/onBoarding/onBoarding_screen.dart';
import 'package:jorism_project/shared/Network/Cache_Helper.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {}

  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 2),()
    // {
    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
    //     return CacheHelper.cachehelper.isNew()
    //         ? OnBoardingScreen()
    //         : LoginScreen();
    //   }));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      pageTransitionType: PageTransitionType.fade,
      animationDuration: Duration(milliseconds: 750),
      backgroundColor: Color(0xFFEACECE),
      splash: Lottie.asset(
        'assets/splash/animation_lkvr1a94.json',
        fit: BoxFit.cover,
      ),
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: 350,
      nextScreen: CacheHelper.cachehelper.isNew()
              ? OnBoardingScreen()
              : LoginScreen()
    );
  }

}