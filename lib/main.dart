import 'package:flutter/material.dart';
import 'package:yabc/ui/home_page.dart';
import 'package:yabc/utils/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YABC",
      theme: lightTheme, // default theme
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
