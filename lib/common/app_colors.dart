import 'package:flutter/material.dart';

class AppColors {
  static const Color darkBlue = Color(0xFF2B5876);
  static const Color darkViolet = Color(0xFF4E4376);

  static const Color mediumViolet = Color(0xFF6B66A6);
  static const Color mediumBlue = Color(0xff75D1DD);

  static const Color mediumVioletOpa = Color(0x4D6B66A6);
  static const Color mediumBlueOpa = Color(0x4D75D1DD);

  static const Color lightViolet = Color(0xFFA6A1E0);
  static const Color lightBlue = Color(0xffA1F3FE);

  static const Color dotViolet = Color(0xFF826EC8);
  static const Color dotBlue = Color(0xff64ABDB);

  static const LinearGradient background = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      darkBlue,
      darkViolet,
    ],
  );

  static const LinearGradient search = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      mediumVioletOpa,
      mediumBlueOpa,
    ],
  );

  static const LinearGradient menu = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      lightViolet,
      lightBlue,
    ],
  );

  static const LinearGradient dotIndicator = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      dotBlue,
      dotViolet,
    ],
  );
}
