import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle get montserratRegular => GoogleFonts.montserrat(
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        color: Colors.black54,
      );

  static TextStyle get montserratBold => GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 12.0,
        color: Colors.black54,
      );

  static TextStyle get montserratItalic => GoogleFonts.montserrat(
        fontStyle: FontStyle.italic,
        fontSize: 12.0,
        color: Colors.black54,
      );
  static TextStyle get montserratBoldHeader => GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
        color: Colors.black54,
      );
}
