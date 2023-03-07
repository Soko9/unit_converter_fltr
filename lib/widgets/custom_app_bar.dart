import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({
  required BuildContext context,
  required String title,
  ColorSwatch? color,
  bool hasBack = false,
}) =>
    AppBar(
      title: Text(
        title.toUpperCase(),
        textAlign: TextAlign.start,
        style: const TextStyle(
          letterSpacing: 2.5,
          fontSize: 24.0,
          fontWeight: FontWeight.w200,
        ),
      ),
      leading: const SizedBox(),
      foregroundColor: Colors.black87,
      backgroundColor: color ?? Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
      // excludeHeaderSemantics: true,
    );
