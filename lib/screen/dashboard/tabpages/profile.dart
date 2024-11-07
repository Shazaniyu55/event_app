// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:event_app/helpers/screen_navigation.dart';
import 'package:event_app/screen/dashboard/settings.dart';
import 'package:event_app/widgets/gallery.dart';
import 'package:event_app/widgets/igtv.dart';
import 'package:event_app/widgets/profile_header.dart';
import 'package:event_app/widgets/reels.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              "john.doe",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          centerTitle: false,
          elevation: 0,
          actions: [
            
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () =>  changeScreen(context, const SettingsPage2()),
            )
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    profileHeaderWidget(context),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs:  const [
                    Tab(
                     text: "Post Feed",
                        
                    ),
                    
                    Tab(
                      text: "Photo",
                    ),

                     Tab(
                      text:  "About",
                    ),
                  ],
                ),
              ),
               const Expanded(
                child: TabBarView(
                  children: [
                     Gallery(),
                    Igtv(),
                    Reels()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}