// ignore_for_file: file_names, use_super_parameters, unused_import, unnecessary_import
import 'dart:typed_data';

import 'package:event_app/constant/colors.dart';
import 'package:event_app/controller/appController.dart';
import 'package:event_app/helpers/screen_navigation.dart';
import 'package:event_app/screen/login.dart';
import 'package:event_app/screen/verifyemail.dart';
// import 'package:event_app/screen/home/dashboard.dart';
// import 'package:event_app/screen/login.dart';
import 'package:event_app/services/utilservice.dart';
import 'package:event_app/widgets/bottomrectangularbtn.dart';
import 'package:event_app/widgets/commonwidget.dart';
import 'package:event_app/widgets/inputField.dart';
import 'package:event_app/widgets/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final appController = Get.find<AppController>();

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController jobtitleController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var fNameError = ''.obs;
  var lNameError = ''.obs;
  var nameError = ''.obs;
  var emailError = ''.obs;
  var jobtitleError = ''.obs;
  var organizationError = ''.obs;
  var passError = ''.obs;
  var checkBoxErr = ''.obs;

  var checkBox = false.obs;
  final jobRoleCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          backgroundColor: white,
          body: Padding(
            padding: const EdgeInsets.only(
              left: 29.0,
              right: 29.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            height: 35,
                            width: 35,
                            color: Colors.transparent,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: headingColor.value,
                            )),
                      ),
                      const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                        "Whats Your Name?",
                        style: TextStyle(
                          color: headingColor.value,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          fontFamily: "sfpro",
                        ),
                      ),
                      const SizedBox(height: 4),
                      
                      Text(
                        "Members here user their real names to build\n and community?",
                        style: TextStyle(
                          color: primaryColor.value,
                          fontSize: 12,
                          fontFamily: "sfpro",
                        ),
                      ),
                          ],
                        )
                      
                      ),
                      
                    ],
                  ),
                  const SizedBox(
                    height: 46,
                  ),
                  InputFieldsWithSeparateIcon(
                    headerText: "First name",
                    hintText: "First name",
                    svg: 'user',
                    onChange: (val) {
                      if (val != null && val != '') {
                        fNameError.value = '';
                      }
                    },
                    textController: fNameController,
                    hasHeader: true,
                  ),
                  CommonWidgets.showErrorMessage(fNameError.value),
                  InputFieldsWithSeparateIcon(
                    headerText: "Last name",
                    hintText: "Last name",
                    svg: 'user',
                    onChange: (val) {
                      if (val != null && val != '') {
                        lNameError.value = '';
                      }
                    },
                    textController: lNameController,
                    hasHeader: true,
                  ),
                  CommonWidgets.showErrorMessage(lNameError.value),
                  InputFieldsWithSeparateIcon(
                    headerText: "Job Title",
                    hintText: "Job Title",
                    svg: 'user',
                    onChange: (val) {
                      if (val != null && val != '') {
                        jobtitleError.value = '';
                      }
                    },
                    textController: jobtitleController,
                    hasHeader: true,
                  ),
                  CommonWidgets.showErrorMessage(jobtitleError.value),
                  InputFieldsWithSeparateIcon(
                    headerText: "Organization",
                    hintText: "Organization",
                    svg: 'user',
                    onChange: (val) {
                      if (val != null && val != '') {
                        organizationError.value = '';
                      }
                    },
                    textController: organizationController,
                    hasHeader: true,
                  ),
                  CommonWidgets.showErrorMessage(organizationError.value),
                  InputFieldsWithSeparateIcon(
                    headerText: "Email",
                    hintText: "Email Address",
                    svg: 'email',
                    onChange: (val) {
                      if (val != null && val != '') {
                        emailError.value = '';
                      }
                    },
                    textController: emailController,
                    hasHeader: true,
                  ),
                  CommonWidgets.showErrorMessage(emailError.value),
                  InputFieldPassword(
                    headerText: "Password",
                    svg: 'pass',
                    hintText: "********",
                    onChange: (value) {
                      if (value != null && value != '') {
                        passError.value = '';
                      }
                    },
                    textController: passController,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: primaryColor.value,
                          checkColor: headingColor.value,
                          focusColor: headingColor.value,
                          hoverColor: headingColor.value,
                          value: checkBox.value,
                          onChanged: (bool? value) {
                            checkBox.value = value!;
                            checkBoxErr.value = '';
                          }),
                      Row(
                        children: [
                          Text(
                            "I agree to all the ",
                            style: TextStyle(
                                color: headingColor.value,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: "sfpro",
                                height: 1.40),
                          ),
                          GestureDetector(
                            onTap: () {
                              UtilService().launchURL(context, '');
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Text(
                                "Terms & Conditions",
                                style: TextStyle(
                                    color: headingColor.value,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "sfpro",
                                    height: 1.40),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  CommonWidgets.showErrorMessage(checkBoxErr.value),
                  BottomRectangularBtn(
                    onTapFunc: () {
                      verifyFields();
                    },
                    btnTitle: "Continue",
                    textColor: white,
                    color: primaryColor.value,
                    loadingText: 'Creating account...',
                    isLoading: appController.registerLoader.value,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const LoginScreen());
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  color: headingColor.value,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "sfpro",
                                  height: 1.40),
                            ),
                            Text(
                              " Login",
                              style: TextStyle(
                                  color: primaryColor.value,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "sfpro",
                                  height: 1.40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  verifyFields() async {
    if (fNameController.text.trim() == '') {
      fNameError.value = 'Please enter your first name.';
    } else if (lNameController.text.trim() == '') {
      lNameError.value = 'Please enter your last name.';
    } else if (emailController.text.trim() == '') {
      emailError.value = 'Please enter your email.';
    } else if (UtilService().isEmail(emailController.text) == false) {
      emailError.value = 'Invalid Email.';
    } else if (passController.text.length < 8) {
      passError.value = 'Minimum length should be 8.';
    } else if (!lowerCase.hasMatch(passController.text)) {
      passError.value = 'Minimum 1 lowercase character required.';
    } else if (!upperCase.hasMatch(passController.text)) {
      passError.value = 'Minimum 1 uppercase character required.';
    } else if (!containsNumber.hasMatch(passController.text)) {
      passError.value = 'Minimum 1 digit required.';
    } else if (!hasSpecialCharacters.hasMatch(passController.text)) {
      passError.value = 'Minimum 1 special character required.';
    } else if (checkBox.value == false) {
      checkBoxErr.value = 'Please accept our terms & conditions.';
    } else if (jobtitleController.text.trim() == '') {
      jobtitleError.value = "Please enter your jobTitle";
    } else if (organizationController.text.trim() == '') {
      organizationError.value = "Please enter your organization type";
    } else {
      changeScreenReplacement(context, const VerifyScreen());
    }
  }
}
