import 'package:flutter/material.dart';

Widget defaultTextFormField({

  TextEditingController? controller,
  required TextInputType type,
  void Function()? onTap,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
  bool obscure = false,
  String? Function(String?)? validate,
  int? maxLines = 1,
  Color? color,

//////////////////////////////////////
  String? label ,
  IconData? prefix,
  IconData? suffix,
  void Function()? suffixPressed,
  String? hintText,
  InputBorder? border ,
  BorderRadius? borderRadius
  bool isPassword = false
})=>TextFormField(
  controller: controller,
  keyboardType: type,
  onTap: onTap,
  onChanged: onChanged,
  onFieldSubmitted: onSubmitted,
  obscureText: obscure,
  validator: validate,
  maxLines: maxLines,

  //decoration of textFormField

  decoration: InputDecoration(
    hintText: hintText,
    labelText : label,
    filled: true,
    fillColor: color,
    suffixIcon: IconButton(
      onPressed: suffixPressed,
      icon: Icon(suffix),
    ),
    prefixIcon: Icon(
      prefix,
    ),
    border: border??OutlineInputBorder(
        borderRadius: borderRadius??BorderRadius.all(
          Radius.circular(15.0),
        ),
        borderSide: BorderSide.none
    ),

  ),

);


Widget defaultButton({
  double width = double.infinity,
  Color? background ,
  bool isUpperCase = false,
  double radius = 3.0,
  required Function()? onPressed,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );


