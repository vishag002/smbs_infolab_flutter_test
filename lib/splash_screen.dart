import 'package:flutter/material.dart';
import 'package:smbs_infolab_flutter_test/products/views/home_screen.dart';
import 'package:smbs_infolab_flutter_test/auth/views/login_screen.dart';
import 'package:smbs_infolab_flutter_test/utilis/token_helper.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    tokenStatus();
  }

  Future<void> tokenStatus() async {
    await Future.delayed(
      const Duration(seconds: 3),
    ); // Optional delay to show splash
    final token = await TokenHelper.getToken();

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assetts/lottie/Animation - 1752047579950.json',
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
