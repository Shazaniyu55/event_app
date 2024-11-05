// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:event_app/constant/colors.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  bool _isShowUser = false;
  final issueTextEditingController = TextEditingController();
  bool isDrawerOpened = true;

  // Sample mock data for users
  List<Map<String, dynamic>> mockUsers = [
    {
      'id': '1',
      'name': 'Dr. John Doe',
      'img': 'images/user.png',
      'rating': 5,
      'is_Online': true,
      'medicalField': '1 minute ago',
    },
    {
      'id': '2',
      'name': 'Nurse Anna',
      'img': 'images/user.png',
      'rating': 4,
      'is_Online': false,
      'medicalField': '2 minute ago',
    },
    {
      'id': '3',
      'name': 'Dr. Jane Smith',
      'img': 'images/user.png',
      'rating': 4,
      'is_Online': true,
      'medicalField': '3 minute ago',
    },
    // Add more mock users here as needed
  ];

  Widget UserList({
    required String id,
    required String name,
    required String imageUrl,
    required bool isOnline,
    required int star,
    required String messageText,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle onTap action here
        //makeRequest();
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 10),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl), // Set the image
              maxRadius: 30,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name, // Display user's name
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      isOnline ? 'Online' : 'Offline', // Display online status
                      style: TextStyle(
                        color: isOnline ? Colors.green : Colors.red,
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        messageText,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: primaryColor.value,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        title: const ListTile(
            title: Center(
          child: Text("Direct Message"),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: IconButton(
              onPressed: () {
                // Handle the additional action for the list icon
              },
              icon: const Icon(Icons.list_rounded),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // Height of the shadow
          child: Container(
            height: 2.0, // Thickness of the shadow line
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Shadow color
                  blurRadius: 0.4, // Blur effect
                  offset:
                      const Offset(0, 2), // Shadow direction (offset downwards)
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Add any other widgets here
            _contentSendMoney(), // Your custom horizontal scroll widget

            // Display the user list (scrollable)
            _isShowUser
                ? ListView.builder(
                    shrinkWrap:
                        true, // Makes the ListView take only the required space
                    itemCount:
                        mockUsers.length, // Using mock data instead of Firebase
                    itemBuilder: (context, index) {
                      var user = mockUsers[index];
                      return UserList(
                        id: user['id'],
                        name: user['name'],
                        imageUrl: user['img'],
                        isOnline: user['is_Online'],
                        star: user['rating'],
                        messageText: user['medicalField'],
                      );
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: mockUsers.length,
                    itemBuilder: (context, index) {
                      var user = mockUsers[index];
                      return UserList(
                        id: user['id'],
                        name: user['name'],
                        imageUrl: user['img'],
                        isOnline: user['is_Online'],
                        star: user['rating'],
                        messageText: user['medicalField'],
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

Widget _buildAvatarContainer(String avatarAsset) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      const SizedBox(height: 40,),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xffD8D9E4)),
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(avatarAsset), // Set the image
          maxRadius: 30,
        ),
      ),
    ],
  );
}

Widget _contentSendMoney() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: <Widget>[
       
       
        _buildAvatarContainer('images/user.png'),
        const SizedBox(width: 20,),
        _buildAvatarContainer('images/user.png'),
        const SizedBox(width: 20,),
        _buildAvatarContainer('images/user.png'),
        const SizedBox(width: 20,),
        _buildAvatarContainer('images/user.png'),
        const SizedBox(width: 20,),
        _buildAvatarContainer('images/user.png'),
        const SizedBox(width: 20,),
        _buildAvatarContainer('images/user.png'),
        const SizedBox(width: 20,),
        _buildAvatarContainer('images/user.png'),
      ],
    ),
  );
}
