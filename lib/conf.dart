import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Conf {
  //Colors
  Color primaryColor = const Color.fromRGBO(30, 162, 211, 1);

  //Typography
  var fontName = GoogleFonts.poppins().fontFamily;
  var titleStyle = TextStyle(
      fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
      fontSize: 32);
  var textStyle =
      TextStyle(fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 18);
}
