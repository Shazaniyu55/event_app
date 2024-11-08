// ignore_for_file: sized_box_for_whitespace, file_names, deprecated_member_use, use_super_parameters

import 'package:event_app/constant/colors.dart';
import 'package:event_app/controller/appController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputFields extends StatelessWidget {
  final appController = Get.find<AppController>();
  final String headerText;
  final String hintText;
  final bool hasHeader;
  final TextEditingController? textController;
  final bool? isEditable;
  final Widget? suffixIcon;
  final Function? onChange;
  final TextInputType? inputType;

  InputFields(
      {Key? key,
      required this.headerText,
      required this.hintText,
      required this.hasHeader,
      this.textController,
      this.isEditable,
      this.suffixIcon,
      this.inputType,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        TextField(
          cursorColor: COLOR_BACKGROUND,
          cursorHeight: 20,
          controller: textController,
          enabled: isEditable,
          keyboardType: inputType ?? TextInputType.text,
          inputFormatters: [
            inputType == null
                ? LengthLimitingTextInputFormatter(
                    headerText.contains('Name') ? 18 : 50)
                : FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,10}'))
          ],
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'sfpro',
              color: inputFieldTextColor.value),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'sfpro',
                  color: appController.isDark.value
                      ? labelColor.value
                      : placeholderColor),
              filled: true,
              fillColor: inputFieldBackgroundColor.value,
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: cardColor.value, width: 0.1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: cardColor.value, width: 0.1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: cardColor.value, width: 0.1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: cardColor.value, width: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: suffixIcon ?? const SizedBox()),
          onChanged: (value) {
            onChange!.call(value);
          },
        ),
      ],
    );
  }
}

class InputFieldPassword extends StatefulWidget {
  final String headerText;
  final String hintText;
  final TextEditingController? textController;
  final bool? isEditable;
  final Function onChange;
  final String? svg;

  const InputFieldPassword({
    Key? key,
    required this.headerText,
    required this.hintText,
    required this.textController,
    required this.onChange,
    this.isEditable,
    this.svg,
  }) : super(key: key);

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;
  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            widget.headerText,
            style: const TextStyle(
              color: placeholderColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'sfpro',
            ),
          ),
        ),
        Container(
          width: Get.width * 0.95,
          child: Row(
            children: [
              
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: TextField(
                  cursorColor: primaryColor.value,
                  cursorHeight: 20,
                  enabled: widget.isEditable,
                  onChanged: (val) {
                    widget.onChange.call(val);
                  },
                  style: TextStyle(color: inputFieldTextColor.value),
                  controller: widget.textController,
                  obscureText: _visible,
                  decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'sfpro',
                          color: placeholderColor),
                      filled: true,
                      //<-- SEE HERE
                      fillColor: inputFieldBackgroundColor.value,
                      //focusColor: activeInputColor,
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        borderSide:
                            BorderSide(color: cardColor.value, width: 0.1),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        borderSide:
                            BorderSide(color: cardColor.value, width: 0.1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        borderSide:
                            BorderSide(color: cardColor.value, width: 0.1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: cardColor.value, width: 0.1),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(
                              !_visible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: primaryColor.value),
                          onPressed: () {
                            setState(() {
                              _visible = !_visible;
                            });
                          })),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

TextStyle defaultBtnStyle =
    TextStyle(color: btnTxtColor, fontSize: 18, fontFamily: 'sfpro');

class InputFieldsWithSeparateIcon extends StatelessWidget {
  final appController = Get.find<AppController>();
  final String headerText;
  final String hintText;
  final bool hasHeader;
  final TextEditingController? textController;
  final bool? isEditable;
  final Widget? suffixIcon;
  final Function? onChange;
  final String? svg;
  final TextInputType? inputType;

  InputFieldsWithSeparateIcon(
      {Key? key,
      required this.headerText,
      required this.hintText,
      required this.hasHeader,
      this.textController,
      this.isEditable,
      this.suffixIcon,
      this.svg,
      this.inputType,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            headerText,
            style: const TextStyle(
              color: placeholderColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'sfpro',
            ),
          ),
        ),
        Container(
          width: Get.width * 0.95,
          child: Row(
            children: [
              
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: TextField(
                  cursorColor: primaryColor.value,
                  cursorHeight: 20,
                  controller: textController,
                  enabled: isEditable,
                  keyboardType: inputType ?? TextInputType.text,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                        headerText.contains('Name') ? 12 : 40),
                  ],
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'sfpro',
                      color: inputFieldTextColor.value),
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'sfpro',
                          color: placeholderColor),
                      filled: true,
                      fillColor: inputFieldBackgroundColor.value,
                      hintText: hintText,
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        borderSide:
                            BorderSide(color: cardColor.value, width: 0.1),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        borderSide:
                            BorderSide(color: cardColor.value, width: 0.1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        borderSide:
                            BorderSide(color: cardColor.value, width: 0.1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: cardColor.value, width: 0.1),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                      suffixIcon: suffixIcon ?? const SizedBox()),
                  onChanged: (value) {
                    onChange?.call(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

RegExp lowerCase = RegExp(r"(?=.*[a-z])\w+");
RegExp upperCase = RegExp(r"(?=.*[A-Z])\w+");
RegExp containsNumber = RegExp(r"(?=.*?[0-9])");
RegExp hasSpecialCharacters =
    RegExp(r"[ !@#$%^&*()_+\-=\[\]{};':" "\\|,.<>/?]");
