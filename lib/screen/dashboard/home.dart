import 'package:event_app/constant/colors.dart';
import 'package:event_app/screen/dashboard/tabpages/chat.dart';
import 'package:event_app/screen/dashboard/tabpages/chat_list.dart';

import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with
  SingleTickerProviderStateMixin 
 {

  var scaffoldState = GlobalKey<ScaffoldState>();

  TabController? tabController;
  int selectedScreen = 0;

  onItemClicked(int index) {
    setState(() {
      selectedScreen = index;
      tabController!.index = selectedScreen;
    });
  }

    @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          key: scaffoldState,
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
            children:  [
                 const Dashboard(),
                 MyChatApp(userId: "1", name: "john", img: "user.png", isOnline: true),
                 const ChatList()
            ]),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Saved'),
            BottomNavigationBarItem(icon: Icon(Icons.face_6_outlined), label: 'Profile'),
              ],
              unselectedItemColor: COLOR_BACKGROUND,
              selectedItemColor: COLOR_PRIMARY,
              backgroundColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              currentIndex: selectedScreen,
              onTap: onItemClicked,
            ),
        ),
    );
  }
}