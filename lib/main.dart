import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ColorChanger(),
    );
  }
}

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;

  void changeColors() {
    setState(() {
      backgroundColor = getRandomColor();
      textColor = getContrastColor(backgroundColor);
    });
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  Color getContrastColor(Color color) {
    final double luminance =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeColors,
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: backgroundColor,
        child: Center(
          child: Text(
            'Hello there',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: textColor,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
