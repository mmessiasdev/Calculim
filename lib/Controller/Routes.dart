import 'package:app/View/HomePage/HomePage.dart';
import 'package:app/View/Result/Result.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Result',
      routes: {
        '/': (context) => HomePage(),
        '/HomePage': (context) => HomePage(),
      },
    );
  }
}
