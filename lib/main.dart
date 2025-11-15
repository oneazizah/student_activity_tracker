// lib/main.dart
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const StudentActivityTrackerApp());
}

class StudentActivityTrackerApp extends StatelessWidget {
  const StudentActivityTrackerApp({super.key}); // ✅ pakai super parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Activity Tracker',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}
