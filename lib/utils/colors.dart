import 'package:flutter/material.dart';

class CustomColors {
  static const colorBG = Color(0xfffffffc);

  static colors({required String category}) {
    switch (category) {
      case "Length":
        return ColorSwatch(
          0xFF9BF6FF,
          {
            "background": const Color(0xff9bf6ff).withOpacity(0.2),
            "splash": const Color(0xff9bf6ff).withOpacity(0.6),
            "highlight": const Color(0xff9bf6ff).withOpacity(0.8),
          },
        );

      case "Area":
        return ColorSwatch(
          0xff73df5d,
          {
            "background": const Color(0xff73df5d).withOpacity(0.2),
            "splash": const Color(0xff73df5d).withOpacity(0.6),
            "highlight": const Color(0xff73df5d).withOpacity(0.8),
          },
        );

      case "Volume":
        return ColorSwatch(
          0xffffadad,
          {
            "background": const Color(0xffffadad).withOpacity(0.2),
            "splash": const Color(0xffffadad).withOpacity(0.6),
            "highlight": const Color(0xffffadad).withOpacity(0.8),
          },
        );

      case "Mass":
        return ColorSwatch(
          0xfff5f057,
          {
            "background": const Color(0xfff5f057).withOpacity(0.2),
            "splash": const Color(0xfff5f057).withOpacity(0.6),
            "highlight": const Color(0xfff5f057).withOpacity(0.8),
          },
        );

      case "Time":
        return ColorSwatch(
          0xffa0c4ff,
          {
            "background": const Color(0xffa0c4ff).withOpacity(0.2),
            "splash": const Color(0xffa0c4ff).withOpacity(0.6),
            "highlight": const Color(0xffa0c4ff).withOpacity(0.8),
          },
        );

      case "Digital Storage":
        return ColorSwatch(
          0xffffd6a5,
          {
            "background": const Color(0xffffd6a5).withOpacity(0.2),
            "splash": const Color(0xffffd6a5).withOpacity(0.6),
            "highlight": const Color(0xffffd6a5).withOpacity(0.8),
          },
        );

      case "Energy":
        return ColorSwatch(
          0xffbdb2ff,
          {
            "background": const Color(0xffbdb2ff).withOpacity(0.2),
            "splash": const Color(0xffbdb2ff).withOpacity(0.6),
            "highlight": const Color(0xffbdb2ff).withOpacity(0.8),
          },
        );
    }
  }

  // ColorSwatch colorPINK() => ColorSwatch(
  //   0xffffc6ff,
  //   {
  //     "background": const Color(0xffffc6ff).withOpacity(0.2),
  //     "splash": const Color(0xffffc6ff).withOpacity(0.6),
  //     "highlight": const Color(0xffffc6ff).withOpacity(0.8),
  //   },
  // );
}
