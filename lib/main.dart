import 'package:flutter/material.dart';
import 'package:p1_donut_app_pablo_soberanis/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  const HomePage(),
      theme: ThemeData( tabBarTheme: const TabBarTheme(indicatorColor: Colors.pink)),
      );
  }
}
