import 'package:flutter/material.dart';
import 'package:amaizi/screens/home_screen.dart';
import 'package:amaizi/screens/splash_screen.dart';


void main() {
  runApp(SafeDrink());
}

class SafeDrink extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => SplashScreen(),
        'home': (context) => HomeScreen(),
      },
    );
  }
}

