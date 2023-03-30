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
        primarySwatch: Colors.brown,
        fontFamily: 'Rubik',
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        scaffoldBackgroundColor: const Color(0xFF161616),
      ),
      home: const MoviesPage(),
    );
  }
}
