import 'package:flutter/material.dart';
import 'package:kort_og_bbr/Screens/map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kort og BBR Version 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapScreen(title: 'Kort og BBR Version 2'),
    );
  }
}
