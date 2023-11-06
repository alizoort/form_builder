import 'package:flutter/material.dart';
const kTextInputFocusColor = Color(0xff3fba81);
const kTextInputBorderSide = BorderSide(width: 2.0);
InputDecoration kTextInputDecoration = InputDecoration(
  floatingLabelStyle: kTextInputFloatingLabelStyle,
    focusedBorder: kFocusedTextInputOutlineInputBorder,
  border: kTextInputOutlineInputBorder
);
const kTextInputBorderRadius = BorderRadius.all(Radius.circular(8));
const kTextInputFloatingLabelStyle = TextStyle(color: kTextInputFocusColor);
const kTextInputOutlineInputBorder =  OutlineInputBorder(  borderSide: kTextInputBorderSide,borderRadius: kTextInputBorderRadius);
final kFocusedTextInputOutlineInputBorder = kTextInputOutlineInputBorder.copyWith(borderSide: kTextInputBorderSide.copyWith(color: kTextInputFocusColor));