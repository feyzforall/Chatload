import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants/boxes.dart';
import 'chat/chat_screen.dart';
import 'common_widgets/app_name_view.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        var showOnboarding = Hive.box(Boxes.showOnboarding).get(
          'showOnBoarding',
          defaultValue: true,
        );
        if (showOnboarding) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ChatScreen()),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppNameView(
          appNameType: AppNameType.body,
        ),
      ),
    );
  }
}
