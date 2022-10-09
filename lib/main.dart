import 'package:chat_sample/pages/top_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
        useMaterial3: true,
        primarySwatch: Colors.blueGrey,
      ),
      home: const TopPage(),
    );
  }
}
