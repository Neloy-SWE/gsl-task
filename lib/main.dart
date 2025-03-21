/*
* Created by Neloy on 20 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsl_task/utilities/app_text.dart';
import 'package:gsl_task/utilities/app_themes.dart';
import 'package:gsl_task/views/screens/screen_splash.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppText.title,
        theme: AppTheme.get,
        home: const SplashScreen(),
      ),
    );
  }
}
