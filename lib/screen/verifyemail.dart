// ignore_for_file: deprecated_member_use, use_super_parameters, avoid_print

import 'package:event_app/constant/colors.dart';
import 'package:event_app/controller/appController.dart';
// import 'package:event_app/helper/navigator.dart';
// import 'package:event_app/screen/forgotpass.dart';
// import 'package:event_app/screen/home/dashboard.dart';
import 'package:event_app/screen/signup.dart';
import 'package:event_app/services/utilservice.dart';
import 'package:event_app/widgets/bottomrectangularbtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
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
                    height: 90,
                  ),
                
                    OtpPinField(
                    maxLength: 4,
                    otpPinFieldStyle: const OtpPinFieldStyle(
                     defaultFieldBackgroundColor: Colors.black
                      
                    ),
                    onSubmit: (String pin) {
                      print("OTP Entered: $pin");
                    }, onChange: (String text) {  },
                    fieldHeight: 60,
                    fieldWidth: 60,
                  ),
                  const SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          //Get.to(const ForgotPassword());
                        },
                        child: Text(
                          "Didnt Get Code?",
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
                    btnTitle: 'Verify',
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
      //changeScreenReplacement(context, const Dashboard());
    }
  }
}
