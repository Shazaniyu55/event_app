// ignore_for_file: avoid_print, use_build_context_synchronously, sized_box_for_whitespace, file_names, use_super_parameters
import 'package:event_app/constant/colors.dart';
import 'package:event_app/helpers/screen_navigation.dart';
import 'package:event_app/screen/app_intro/introdudction.dart';
import 'package:event_app/screen/app_intro/introscreenonboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    final List<Introduction> _list = [
    const Introduction(
      title: 'Discover, Join Events ',
      subTitle: 'Browse through a variety of events tailored to your interests. Register for sessions, track your favourite topics.',
      imageUrl: 'images/splash1.png',
    ),
    const Introduction(
      title: 'Connect and  Share your views',
      subTitle: 'Engage and connect with fellow attendees through in-app chats, discussions, and social walls.',
      imageUrl: 'images/splash2.png',
    ),
    const Introduction(
      title: 'Engage, Chat and Network',
      subTitle: 'Engage with fellow attendees through in-app chats, discussions, and social walls. Share ideas, connect with speakers, and build lasting professional relationships.',
      imageUrl: 'images/splash3.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
    Future.delayed(const Duration(seconds: 8), () {
      changeScreenReplacement(context, IntroScreenOnboarding(
                                    introductionList: _list,
                                    onTapSkipButton: () {
                                      //Get.offAll(Login(), duration: Duration(milliseconds: 300), transition: Transition.rightToLeft);
                                    },
                                  ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [COLOR_BACKGROUND, Color.fromRGBO(10, 101, 101, 1)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png", width: 120, height: 120,)

          ],
        ),
      ),
    );
  }
}