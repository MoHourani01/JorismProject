import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



Widget defaultProfileFormField({
  required String title,
  IconData? Ficon,
  IconData ? Licon,
  Function()? onTap,
  Function()? onPressed,
  Color ? TextColor,
  Color ? iconColor,
}) =>
Container(
height: 50,
decoration: BoxDecoration(
color:  Colors.white,
borderRadius: BorderRadius.circular(30.0),
),
child: InkWell(
onTap: onTap,
child: ListTile(
trailing: IconButton( onPressed: onPressed , icon: Icon(Licon) ,),
title: Text(title,
style: TextStyle(
color: Color(0xFF4F2E1D),
),),
leading: Icon(Ficon),
iconColor: Color(0xFF4F2E1D),
),
),
);

Widget defaultPaymentFormField({
  double? fieldHeight,
  double? fieldWidth,
  TextEditingController? controller,
  TextInputType? type,
  String? hintText,
  String? Function(String?)? validate,
  IconData? prefix,
  Color? prefixIconColor,
  String? labelText,
  Color? labelStyleColor,
  Function(String)? onSubmit,
  List<PopupMenuEntry<int>>? popupMenuItems, // Add this parameter
}) {
  return Container(
    height: fieldHeight,
    width: fieldWidth,
    child: TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color:Colors.black87,
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.black87,
            )
        ),
        hintText: hintText,
        prefixIcon: prefix != null ? Icon(prefix, color: prefixIconColor) : null,
        labelText: labelText,
        labelStyle: TextStyle(color: labelStyleColor), // Set label text color here
        suffixIcon: PopupMenuButton<int>(
          icon: Icon(Icons.more_horiz_outlined),
          itemBuilder: (context) => popupMenuItems!,
          onSelected: (value) {
            // Do something based on the selected option
            print('Option selected: $value');
          },
        ),
      ),
      validator: validate,
    ),
  );
}



Widget defaultPayFormField({
  double? fieldHeight,
  double? fieldWidth,
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(dynamic)? onChanged,
  //Function? onTap,
  String? hintText,
  required String labelText,
  String? Function(String?)? validate,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  void Function()? suffixPressed,
  Function()? onTap,
  Color? hintStyleColor,
  Color? labilStyleColor,
  Color? BorderColor,
  Color? prefixIconColor,
  Color? suffixIconColor,
  Color? backgroundHintColor,
}) =>
    Container(
      height: fieldHeight,
      width: fieldWidth,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        obscureText: isPassword,
        cursorColor: Color(0xFF4F2E1D),
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: labilStyleColor),
          hintStyle: TextStyle(color: hintStyleColor),
          prefixIcon: Icon(
            prefix,
            color: prefixIconColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: suffixIconColor,
            ),
          )
              : null,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color:Colors.black87,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.black87,
              )
          ),
          // border: InputBorder.none
        ),
        validator:validate,
        onTap:onTap!=null?onTap():null,
      ),
    );


Widget defaultnameFormField({
  double? fieldHeight,
  double? fieldWidth,
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(dynamic)? onChanged,
  // Function? onTap,
  String? hintText,
  required String labelText,
  String? Function(String?)? validate,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  void Function()? suffixPressed,
  Function()? onTap,
  Color? hintStyleColor,
  Color? labilStyleColor,
  Color? BorderColor,
  Color? prefixIconColor,
  Color? suffixIconColor,
  Color? backgroundHintColor,
  AlignmentGeometry alignment = Alignment.center, // Use AlignmentGeometry for flexibility
}) {
  return Align(
    alignment: alignment,
    child: Container(
      height: fieldHeight,
      width: fieldWidth,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        obscureText: isPassword,
        cursorColor: Color(0xFF4F2E1D),
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: labilStyleColor),
          hintStyle: TextStyle(color: hintStyleColor),
          prefixIcon: Icon(
            prefix,
            color: prefixIconColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: suffixIconColor,
            ),
          )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.black87,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.black87,
            ),
          ),
          // border: InputBorder.none
        ),
        validator: validate,
        onTap: onTap != null ? onTap() : null,
      ),
    ),
  );
}


Widget defaultLoginFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(dynamic)? onChanged,
  //Function? onTap,
  String? hintText,
  required String labelText,
  String? Function(String?)? validate,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  void Function()? suffixPressed,
  Function()? onTap,
  Color? hintStyleColor,
  Color? labilStyleColor,
  Color? BorderColor,
  Color? prefixIconColor,
  Color? suffixIconColor,
  Color? backgroundHintColor,
}) =>
    Center(
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        obscureText: isPassword,
        cursorColor: Color(0xFF4F2E1D),
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: labilStyleColor),
          hintStyle: TextStyle(color: hintStyleColor),
          prefixIcon: Icon(
            prefix,
            color: prefixIconColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: suffixIconColor,
            ),
          )
              : null,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color:Colors.black87,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.black87,
              )
          ),
          // border: InputBorder.none
        ),
        validator:validate,
        onTap:onTap!=null?onTap():null,
      ),
    );


Widget defaultDateFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(dynamic)? onChanged,
  String? hintText,
  String? Function(String?)? validate,
  required IconData prefix,
  void Function()? onTap,
  Color? hintStyleColor,
  Color? labilStyleColor,
  Color? BorderColor,
  Color? prefixIconColor,
  Color? backgroundHintColor,
}) =>
    Center(
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        cursorColor: Color(0xFF4F2E1D),
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          // labelText: labelText,
          labelStyle: TextStyle(color: labilStyleColor),
          hintStyle: TextStyle(color: hintStyleColor),
          prefixIcon: Icon(
            prefix,
            color: prefixIconColor,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color:Colors.black87,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.black87,
              )
          ),
          // border: InputBorder.none
        ),
        readOnly: true,
        validator:validate,
        onTap:onTap,
      ),
    );


Widget defaultLoginButton({
  double width = double.infinity,
  Color backround = Colors.white,
  double radius = 0.0,
  //required Function function,
  //required String text,
  required void Function() function,
  required String text,
  Color textButtonColor = Colors.white,
  double? fontSize,
  String? fontFamily,
}) =>
    Container(
      width: width,
      // color: defaultColor,
      height: 50,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: textButtonColor,
            fontSize: fontSize,
            fontFamily: fontFamily,
            // backgroundColor: defaultColor,
          ),
        ),
      ),
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(blurRadius: 5.0,color: Colors.black26),
        //
        // ],
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: backround,
        // gradient: LinearGradient(
        //   begin: Alignment.bottomLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     Color(0xEC952BE8),
        //     Color(0xECAE67F1),
        //     Color(0xECBB98E1),
        //   ],
        // ),
      ),
    );

Widget defaultButton({
  Color backround = Colors.white,
  //required Function function,
  //required String text,
  required void Function() function,
  required String text,
  Color textButtonColor = Colors.white,
  double? fontSize,
  String? fontFamily,
}) =>
    MaterialButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: textButtonColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          // backgroundColor: defaultColor,
        ),
      ),
    );

Widget defaultTextButton({
  required Function() function,
  required String text,
  Color? textButtonColor,
  double? fontSize,
  Function()? fontWeight,
  String? fontFamily,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: textButtonColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
//=======

class Navigators {

  navigateTo(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  navigatorWithBack(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }

  navigatePop(BuildContext context){
    Navigator.pop(context);
  }

  navigatePushReplacement(BuildContext context, Widget widget){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => widget));
      // return Page4();
  }
}

Navigators navigators = Navigators();

void showToast({required String text,required ToastStates state})=>Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates{Success, Error, Warning}

Color? chooseToastColor(ToastStates state){
  Color color;
  switch (state)
  {
    case ToastStates.Success:
      color=Colors.green;
      break;
    case ToastStates.Error:
      color= Colors.red;
      break;
    case ToastStates.Warning:
      color= Colors.amber.shade800;
      break;
  }
  return color;
}

Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey,
  ),
);

// Widget buildArticle(article,context) {
//   return Padding(
//     padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 12.0),
//     child: Container(
//       width: 250,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.grey.shade300,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           // mainAxisAlignment: MainAxisAlignment,
//           children: [
//             Container(
//               width: 150,
//               height: 150,
//               child: Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   side: BorderSide(
//                     color: Colors.grey,
//                   ),
//                   borderRadius: const BorderRadius.all(Radius.circular(12)),
//                 ),
//                 child: Container(
//                   // height: 10,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       image: DecorationImage(
//                           image: NetworkImage('${article['urlToImage']}'), fit: BoxFit.cover
//                       )
//                   ),
//
//                 ),
//               ),
//             ),
//             SizedBox(width: 15,),
//             // Text('Description',style: TextStyle(fontSize: 20),),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${article['title']}',
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   Text(
//                     '${article['publishedAt']}',
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget articleBuilder(list,context,) => ConditionalBuilder(
//   // condition: state is! NewsGetBusinessLoadingChange,
//   condition: list.length>0,
//   builder: (context)=>ListView.builder(
//       physics: BouncingScrollPhysics(),
//       itemBuilder: (context,index)=>buildArticle(list[index],context),
//       itemCount: 20),
//   fallback: (context)=> false ? Container() : Center(child: CircularProgressIndicator()),);
