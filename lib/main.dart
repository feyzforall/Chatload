import 'constants/app_strings.dart';
import 'constants/app_theme.dart';
import 'model/chat_message.dart';
import 'repository/boxes.dart';
import 'view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.openBox(Boxes.boxKeys);
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
