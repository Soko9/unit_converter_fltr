import 'package:flutter/material.dart';
import 'package:unit_converter/screens/category_screen.dart';

void main() {
  runApp(const UnitConverter());
}

class UnitConverter extends StatelessWidget {
  const UnitConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Unit Converter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Raleway",
      ),
      home: const CategoryScreen(),
    );
  }
}
