import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/ui/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: const AppTheme(false).themeData,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen()
    );
  }
}