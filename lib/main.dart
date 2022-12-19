import 'package:flutter/material.dart';

import 'src/screens/screens_export.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 18, 82, 134),
      ),
      home: const LoginScreen(),
    );
  }
}
