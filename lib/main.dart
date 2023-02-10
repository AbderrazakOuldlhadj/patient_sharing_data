import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:patient_data/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF3683FC),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(.03),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
        ),
      ),
      home: AnimatedSplashScreen(
        splash: SvgPicture.asset('assets/images/logo.svg'),
        nextScreen: HomeScreen(),
      ),
    );
  }
}
