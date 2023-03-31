import 'package:flutter/material.dart';
import 'package:af_trial_project/ui/view/movies_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoCat Project',
      theme: ThemeData(
        fontFamily: 'Rubik',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'Krona One',
              fontSize: 28,
              height: 35 / 28),
          titleMedium: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 1.4),
          titleSmall: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 21 / 18),
          bodyLarge: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.4),
          bodyMedium: TextStyle(color: Color(0xFFFFFFFF)),
          bodySmall:
              TextStyle(color: Color(0xFFE2E2E2), fontSize: 16, height: 1.4),
        ),
        scaffoldBackgroundColor: const Color(0xFF161616),
      ),
      home: const MoviesPage(),
    );
  }
}
