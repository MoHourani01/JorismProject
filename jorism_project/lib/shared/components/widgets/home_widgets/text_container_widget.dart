import 'package:flutter/material.dart';
import 'package:jorism_project/shared/components/constants.dart';


Widget textContainerWidget(
{
  required String text,
  double? fontSize,
}
    ){
  return Container(
    margin: EdgeInsets.only(left: 30, top: 10),
    padding: EdgeInsets.only(top: 20,left: 12),
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
      left: 40,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: primaryFont,
        color: Color(0xFF4F2E1D),
        fontSize: fontSize,
      ),
    ),
  );
}