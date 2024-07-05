import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todos_app/themes/todo_colors.dart';

class TodoTypoGraphy {
  static TextStyle textMedium(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: TodoColors.primary,
          fontSize: 16.0,
          fontFamily: GoogleFonts.acme().fontFamily,
        );
  }

  static TextStyle textHeader(BuildContext context) {
    return textMedium(context).copyWith(
      color: TodoColors.primary.shade700,
      fontSize: 22.0,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle textBold(BuildContext context) {
    return textMedium(context).copyWith(
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textsmall(BuildContext context) {
    return textMedium(context).copyWith(
      fontWeight: FontWeight.w100,
      fontSize: 14.0,
    );
  }
}
