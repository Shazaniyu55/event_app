// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, use_super_parameters, sized_box_for_whitespace

import 'package:event_app/constant/colors.dart';
import 'package:event_app/screen/app_intro/introdudction.dart';
import 'package:event_app/screen/signup.dart';
// import 'package:event_app/screens/app_intro/introdudction.dart';
// import 'package:event_app/screens/signup.dart';
import 'package:event_app/widgets/bottomrectangularbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class IntroScreenOnboarding extends StatefulWidget {
  final List<Introduction>? introductionList;
  final Color? backgroudColor;
  final Color? foregroundColor;
  final TextStyle? skipTextStyle;

  final Function()? onTapSkipButton;

  const IntroScreenOnboarding({
    Key? key,
    this.introductionList,
    this.onTapSkipButton,
    this.backgroudColor,
    this.foregroundColor,
    this.skipTextStyle = const TextStyle(fontSize: 20),
  }) : super(key: key);

  @override
  _IntroScreenOnboardingState createState() => _IntroScreenOnboardingState();
}

class _IntroScreenOnboardingState extends State<IntroScreenOnboarding> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  double progressPercent = 0;
  @override
  void initState() {
    super.initState();
    //loadImgs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: primaryColor.value,

            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          elevation: 0,
        ),
      ),
      body: Material(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                color: primaryColor.value,
                
              ),
              Positioned(
                child: Container(
                  height: Get.height - 90,
                  width: Get.width,
                 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _indicator(_currentPage == 0),
                            _indicator(_currentPage == 1),
                            _indicator(_currentPage == 2),
                          ],
                        ),
                        Expanded(
                          flex: 1,
                          child: PageView(
                            physics: const ClampingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            children: widget.introductionList!,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 28,
                            ),
                            _currentPage != widget.introductionList!.length - 1
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: BottomRectangularBtn(
                                        onTapFunc: () {
                                          _currentPage = _currentPage + 1;
                                          _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                          setState(() {});
                                        },

                                        btnTitle: 'Next', textColor: primaryColor.value),
                                  )
                                : Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: BottomRectangularBtn(
                                          onTapFunc: () {
                                            Get.to(const SignupScreen());
                                          },
                                          
                                          btnTitle: 'Get Started',
                                          textColor: primaryColor.value,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        //_buildNextButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 5,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 10,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isActive ? white : const Color.fromARGB(173, 11, 127, 71),
        ),
      ),
    );
  }
}
