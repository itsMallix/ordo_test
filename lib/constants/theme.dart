import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorSystem {
  ColorSystem._();

  static const Color darkGreen = Color(0xff334A34);
  static const Color lightGreen = Color(0xff9ACA3E);
  static const Color lightRed = Color(0xffFF5C5C);
  static const Color white = Color(0xffFFFFFF);
  static const Color gray200 = Color(0xff9B9B9B);
  static const Color gray300 = Color(0xffABABAB);
  static const Color bgColor = Color(0xffF5F5F5);

  static const Color darkGreenShade = Color(0xff2F4530);
  static const Color lightGrayShade = Color(0xff9B9B9B);
}

class TextSystem {
  TextSystem._();

  static TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.outfit().fontFamily,
  );
  static TextStyle h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.outfit().fontFamily,
  );
  static TextStyle h3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.outfit().fontFamily,
  );

  static TextStyle s1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: GoogleFonts.outfit().fontFamily,
  );

  static TextStyle b1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: GoogleFonts.outfit().fontFamily,
  );
  static TextStyle b2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: GoogleFonts.outfit().fontFamily,
  );
}
