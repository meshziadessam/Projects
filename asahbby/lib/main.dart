import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pages/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color.fromARGB(255, 51, 38, 117),
    statusBarColor: Color.fromARGB(255, 51, 38, 117), 
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue, 
      ),
      home: const HomePage(),
    );
  }
}
