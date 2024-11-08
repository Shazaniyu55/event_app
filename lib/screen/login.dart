// ignore_for_file: deprecated_member_use, use_super_parameters

import 'package:event_app/constant/colors.dart';
import 'package:event_app/controller/appController.dart';
import 'package:event_app/helpers/screen_navigation.dart';
import 'package:event_app/screen/dashboard/home.dart';
// import 'package:event_app/helper/navigator.dart';
// import 'package:event_app/screen/forgotpass.dart';
// import 'package:event_app/screen/home/dashboard.dart';
import 'package:event_app/screen/signup.dart';
import 'package:event_app/services/utilservice.dart';
import 'package:event_app/widgets/bottomrectangularbtn.dart';
import 'package:event_app/widgets/commonwidget.dart';
import 'package:event_app/widgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final appController = Get.find<AppController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var passErr = ''.obs;
  var emailErr = ''.obs;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        top: false,
        child: Scaffold(
          
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 26),
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
                        "SignUp",
                        style: TextStyle(
                          color: headingColor.value,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          fontFamily: "sfpro",
                        ),
                      ),
                      const SizedBox(height: 4),
                      
                      Text(
                        "it is good to have you here, sigup to enjoy nice\n experience with others",
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
                    height: 70,
                  ),
                
                  InputFieldsWithSeparateIcon(
                    headerText: "Email",
                    hintText: "Email Address",
                    svg: 'email',
                    onChange: (val) {
                      if (val != null && val != '') {
                        emailErr.value = '';
                      }
                    },
                    textController: emailController,
                    hasHeader: true,
                  ),
                  CommonWidgets.showErrorMessage(emailErr.value),
                  InputFieldPassword(
                    headerText: "Password",
                    svg: 'key',
                    hintText: '• • • • • • • •',
                    onChange: (val) {
                      if (val != null && val != '') {
                        passErr.value = '';
                      }
                    },
                    textController: passController,
                  ),
                  CommonWidgets.showErrorMessage(passErr.value),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          //Get.to(const ForgotPassword());
                        },
                        child: Text(
                          "forgot password?",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            fontFamily: "sfpro",
                            color: headingColor.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  BottomRectangularBtn(
                    onTapFunc: () {
                      verifyFields();
                    },
                    btnTitle: 'Log in',
                    textColor: white,
                    loadingText: 'Processing...',
                    isLoading: appController.loginLoader.value,
                    color: primaryColor.value,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const SignupScreen());
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
                              "Don't have an account?",
                              style: TextStyle(
                                  color: headingColor.value,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "sfpro",
                                  height: 1.40),
                            ),
                            Text(
                              " Sign Up",
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
    if (emailController.text.trim() == '') {
      emailErr.value = 'Please enter your email.';
    } else if (UtilService().isEmail(emailController.text) == false) {
      emailErr.value = 'Invalid Email.';
    } else if (passController.text.trim() == '') {
      passErr.value = 'Please enter your password.';
    } else {
      changeScreenReplacement(context, const Dashboard());
    }
  }
}
