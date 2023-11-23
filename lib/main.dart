import 'package:doou/screens/login_page.dart';
import 'package:flutter/material.dart';

import '/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doou',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(72, 141, 146, 1.0)),
        useMaterial3: true,
      ),
      home: login_page(),
    );
  }
}
