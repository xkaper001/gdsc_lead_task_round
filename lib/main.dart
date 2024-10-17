import 'package:flutter/material.dart';
import 'package:gdsc_lead_task_round/palette.dart';
import 'package:gdsc_lead_task_round/sign_in_screen.dart';

import 'onboard_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SignInScreen(),
      home: OnboardScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Palette.bg),
    );
  }
}
