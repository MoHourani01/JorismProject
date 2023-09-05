import 'package:flutter/material.dart';
import 'package:jorism_project/shared/components/constants.dart';


Widget textContainerWidget(
    {
      required String text,
      double? fontSize,
    }
    ){
  return Padding(
    padding: const EdgeInsets.only(left: 22),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'Belgiano',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4F2E1D),
      ),
    ),
  );
}

Widget textAgencyContainerWidget(
    {
      required String text,
      double? fontSize,
    }
    ){
  return Padding(
    padding: const EdgeInsets.only(
      left: 22,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'Belgiano',
        fontWeight: FontWeight.bold,
        // fontFamily: primaryFont,
        color: Color(0xFF4F2E1D),
        fontSize: fontSize,
      ),
    ),
  );
}