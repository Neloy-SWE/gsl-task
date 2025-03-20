/*
* Created by Neloy on 20 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gsl_task/utilities/app_size.dart';
import 'package:gsl_task/utilities/app_text.dart';
import 'package:gsl_task/views/screens/screen_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (builder) => const HomeScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppText.welcome,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              AppSize.gapH15,
              CircularProgressIndicator(color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
