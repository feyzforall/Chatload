import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants/app_strings.dart';
import 'constants/app_theme.dart';
import 'constants/boxes.dart';
import 'model/chat_message.dart';
import 'view/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.openBox(Boxes.boxKeys);
  Hive.openBox(Boxes.showOnboarding);

  Hive.registerAdapter(ChatMessageAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: AppStrings.appName,
      home: const SplashScreen(),
    );
  }
}
