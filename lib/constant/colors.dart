// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

const COLOR_PRIMARY = Color.fromRGBO(10, 101, 101, 1);
const COLOR_ACCENT =  Color.fromRGBO(5, 199, 190, 1);
const COLOR_BACKGROUND_DARK = Color(0xFF171822);
const COLOR_BACKGROUND = Colors.white;
const COLOR_BACKGROUND_LIGHT = Color(0xFFF1F3F6);
const COLOR_BLUE = Color.fromRGBO(10, 101, 101, 1);

const Color primary = Color.fromARGB(255, 255, 255, 255);
const Color placeholderColor = Colors.black;
const  red = Colors.red;
const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color green = Colors.green;





var primaryColor = const Color.fromRGBO(10, 101, 101, 1).obs;
var primaryBackgroundColor = const Color.fromRGBO(5, 199, 190, 1).obs;
var dividerColor = const Color(0xFFF2F2F2).obs;
var headingColor = const Color(0xFF030319).obs;
var labelColor = const Color(0xFF8F92A1).obs;
var inputFieldTextColor = const Color(0xFF0F001C).obs;
var inputFieldBackgroundColor = const Color(0xFFFAFAFA).obs;
var listCardColor = const Color(0xFFFAFAFA).obs;

var chatBoxBg = const Color(0xffF8F8F8).obs;

Color btnTxtColor = const Color.fromRGBO(10, 101, 101, 1);
Color errorTxtColor = const Color(0xFFFF0E41);
Color lightColor = const Color(0xFFFCFCFC);
var cardColor = const Color(0xFFFFFFFF).obs;
var greenCardColor = const Color(0xFF39B171).obs;
var redCardColor = const Color.fromARGB(255, 85, 168, 240).obs;
var chipChoiceColor = const Color.fromARGB(255, 130, 148, 237).withOpacity(0.1);
var bSheetbtnColor = const Color(0x0DF9895E).withOpacity(0.10);


///////////history screen colors//////////////
var bgCintainerColor = const Color(0xff27C19F);
var bg2CintainerColor = const Color.fromARGB(255, 79, 141, 241);
var iconUpColor = const Color(0xffE34446);

var iconDownColor = const Color(0xff0C9D7D);


var appBgGradient = const LinearGradient(
  begin: Alignment(0.0, 0.0),
  end: Alignment(0, -1),
  colors: [Color(0xffDB9B3A),Color(0xffFE8664)],
);