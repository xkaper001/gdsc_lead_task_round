import 'package:flutter/material.dart';
import 'package:gdsc_lead_task_round/palette.dart';
import 'package:gdsc_lead_task_round/sign_in_screen.dart';

import 'onboard_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardScreen(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
      ),
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? _darkTheme : _lightTheme,
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  final ThemeData _lightTheme = ThemeData(
    scaffoldBackgroundColor: Palette.bg,
    brightness: Brightness.light,
  );

  final ThemeData _darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    
  );
}
