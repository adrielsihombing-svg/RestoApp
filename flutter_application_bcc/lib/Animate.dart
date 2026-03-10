import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'Syarat.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => OnboardingScreen());
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 141, 178, 241),
      body: Center(
        child: FadeInLeftBig(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/IMG/SS_02.png',
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5.0),
              Text(
                "Basic Shop",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Fulfil Your Daily Needs",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
