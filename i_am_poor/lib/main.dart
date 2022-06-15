import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: const Center(
          child: Image(
            image: AssetImage('images/i_am_poor.jpeg'),
          ),
        ),
        appBar: AppBar(
          title: const Center(child: Text('I am poor')),
          backgroundColor: Colors.amber[600],
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
    ),
  );
}
