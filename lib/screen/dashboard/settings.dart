// ignore_for_file: unused_import, unnecessary_import, unused_element, prefer_final_fields, use_super_parameters, duplicate_ignore

import 'package:event_app/constant/colors.dart';
import 'package:event_app/helpers/screen_navigation.dart';
import 'package:event_app/screen/splash.dart';
import 'package:event_app/widgets/commonwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage2 extends StatefulWidget {
  // ignore: use_super_parameters
  const SettingsPage2({Key? key}) : super(key: key);

  @override
  State<SettingsPage2> createState() => _SettingsPage2State();
}

class _SettingsPage2State extends State<SettingsPage2> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children:  const [
                _SingleSection(
                  children: [
                    _CustomListTile(
                      title: "My Profile",
                      icon: Icons.person_outline_rounded,
                      iconColor:
                          Colors.blue, // Set your desired icon color here
                      trailing: Icons.arrow_forward_ios_rounded,
                      destinationPage: SplashScreen() // Icon on the right side
                    ),
                    Divider(),
                    _CustomListTile(
                      title: "Saved",
                      icon: Icons.save,
                      iconColor: Colors.green,
                      trailing: Icons.arrow_forward_ios_rounded,
                      destinationPage: SplashScreen()
                    ),
                    Divider(),
                    _CustomListTile(
                      title: "Notification Setting",
                      icon: Icons.notifications,
                      iconColor: Colors.red,
                      trailing: Icons.arrow_forward_ios_rounded,
                      destinationPage: SplashScreen()
                    ),
                    Divider(),
                    _CustomListTile(
                      title: "Liked",
                      icon: Icons.thumb_up_alt_rounded,
                      iconColor: Colors.orange,
                      trailing: Icons.arrow_forward_ios_rounded,
                      destinationPage: SplashScreen()
                    ),
                    Divider(),
                    _CustomListTile(
                      title: "Password Manager",
                      icon: Icons.lock_outline_sharp,
                      iconColor: Colors.purple,
                      trailing: Icons.arrow_forward_ios_rounded,
                      destinationPage: SplashScreen()
                    ),
                    Divider(),
                    _CustomListTile(
                        title: "Analytics",
                        iconColor: Colors.purple,
                        icon: Icons.analytics_outlined,
                        trailing: Icons.arrow_forward_ios_rounded,destinationPage: SplashScreen()),
                    Divider(),
                    _CustomListTile(
                        title: "Help Center",
                        iconColor: Colors.purple,
                        icon: Icons.help_outline,
                        trailing: Icons.arrow_forward_ios_rounded,destinationPage: SplashScreen()),
                    Divider(),
                    _CustomListTile(
                        title: "Privacy Policy",
                        iconColor: Colors.purple,
                        icon: Icons.privacy_tip,
                        trailing: Icons.arrow_forward_ios_rounded, destinationPage: SplashScreen(),),
                    Divider(),
                    _CustomListTile(
                        title: "Sign out",
                        iconColor: Colors.purple,
                        icon: Icons.exit_to_app_rounded,
                        trailing: Icons.arrow_forward_ios_rounded,
                        destinationPage: CustomBottomSheet() // Custom bottom sheet for sign out
                        ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData? trailing;
  final Widget destinationPage; // Destination page for navigation

  const _CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.trailing,
    required MaterialColor iconColor,
    required this.destinationPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(
        icon,
        color: primaryColor.value,
      ),
      trailing: Icon(trailing),
      onTap: () {
        if (destinationPage is CustomBottomSheet) {
          CustomBottomSheet.showSignOutBottomSheet(context);
        } else {
          changeScreen(context, destinationPage);
        }
      },
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Are you sure you want to sign out?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Click 'Confirm' to sign out from your account.",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back(); // Close the bottom sheet
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your sign-out logic here
                  print("Sign Out Confirmed");
                  Get.back(); // Close the bottom sheet after action
                },
                child: const Text("Confirm"),
              ),
            ],
          )
        ],
      ),
    );
  }

  static void showSignOutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          minChildSize: 0.25,  // Minimum height of the bottom sheet (10% of the screen)
  maxChildSize: 0.4,  // Maximum height of the bottom sheet (20% of the screen)
  initialChildSize: 0.25, 
          builder: (context, controller) {
            return const CustomBottomSheet();
          },
        );
      },
    );
  }
}
