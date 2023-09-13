import 'package:flutter/material.dart';
import 'package:todo/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anúncios',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      home: HomePage(title: 'Anúncios'),
      debugShowCheckedModeBanner: false,
    );
  }
}
