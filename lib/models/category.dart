// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:unit_converter/models/unit.dart';

class Category {
  final ColorSwatch color;
  final String img;
  final Unit units;

  const Category({
    required this.color,
    required this.img,
    required this.units,
  });

  @override
  String toString() => 'Category(color: $color, img: $img, units: $units)';
}
