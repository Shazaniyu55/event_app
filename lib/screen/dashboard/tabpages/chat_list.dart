// ignore_for_file: non_constant_identifier_names, prefer_final_fields, library_private_types_in_public_api, use_key_in_widget_constructors, unnecessary_import, unused_import, must_be_immutable

import 'package:event_app/helpers/screen_navigation.dart';
import 'package:event_app/model/chat.dart';
import 'package:event_app/screen/dashboard/tabpages/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:event_app/constant/colors.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        text: "Awesome Setup",
        image: "images/user.png",
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        text: "That's Great",
        image: "images/user2.png",
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        text: "Hey where are you?",
        image: "images/user3.png",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        text: "Busy! Call me in 20 mins",
        image: "images/user4.png",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        text: "Thankyou, It's awesome",
        image: "images/user5.png",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        text: "will update you in evening",
        image: "images/user6.png",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        text: "Can you please share the file?",
        image: "images/user6.png",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        text: "How are you?",
        image: "images/user5.png",
        time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  const Text(
                    "Direct Message",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 2),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            // search widget
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),

            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].text,
                  imageUrl: chatUsers[index].image,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList(
      {required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.isMessageRead});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeScreen(context,
            MyChatApp(userId: "1", name: "john", img: "img", isOnline: true));
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
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
                            widget.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

// class ChatList extends StatefulWidget {
//   const ChatList({super.key});

//   @override
//   State<ChatList> createState() => _ChatListState();
// }

// class _ChatListState extends State<ChatList> {
//   bool _isShowUser = false;
//   final issueTextEditingController = TextEditingController();
//   bool isDrawerOpened = true;

//   // Sample mock data for users
//   List<Map<String, dynamic>> mockUsers = [
//     {
//       'id': '1',
//       'name': 'Dr. John Doe',
//       'img': 'images/user.png',
//       'rating': 5,
//       'is_Online': true,
//       'medicalField': '1 minute ago',
//     },
//     {
//       'id': '2',
//       'name': 'Nurse Anna',
//       'img': 'images/user2.png',
//       'rating': 4,
//       'is_Online': false,
//       'medicalField': '2 minute ago',
//     },
//     {
//       'id': '3',
//       'name': 'Dr. Jane Smith',
//       'img': 'images/user3.png',
//       'rating': 4,
//       'is_Online': true,
//       'medicalField': '3 minute ago',
//     },
//     {
//       'id': '4',
//       'name': 'Dr. Jane Smith',
//       'img': 'images/user4.png',
//       'rating': 4,
//       'is_Online': true,
//       'medicalField': '3 minute ago',
//     },
//     {
//       'id': '5',
//       'name': 'Dr. Jane Smith',
//       'img': 'images/user5.png',
//       'rating': 4,
//       'is_Online': true,
//       'medicalField': '3 minute ago',
//     },

//     {
//       'id': '6',
//       'name': 'Dr. Jane Smith',
//       'img': 'images/user5.png',
//       'rating': 4,
//       'is_Online': true,
//       'medicalField': '3 minute ago',
//     },
//     {
//       'id': '7',
//       'name': 'Dr. Jane Smith',
//       'img': 'images/user5.png',
//       'rating': 4,
//       'is_Online': true,
//       'medicalField': '3 minute ago',
//     },

//     {
//       'id': '8',
//       'name': 'Dr. Jane Smith',
//       'img': 'images/user5.png',
//       'rating': 4,
//       'is_Online': true,
//       'medicalField': '3 minute ago',
//     },
//     // Add more mock users here as needed
//   ];

//   Widget UserList({
//     required String id,
//     required String name,
//     required String imageUrl,
//     required bool isOnline,
//     required int star,
//     required String messageText,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         // Handle onTap action here
//         //makeRequest();
//         changeScreenReplacement(context, MyChatApp(userId: "1", name: "john", img: "img", isOnline: true));
//       },
//       child: Container(
//         padding:
//             const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 10),
//         child: Row(
//           children: <Widget>[
//             CircleAvatar(
//               backgroundImage: AssetImage(imageUrl), // Set the image
//               maxRadius: 30,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Expanded(
//               child: Container(
//                 color: Colors.transparent,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       name, // Display user's name
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                     const SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       isOnline ? 'Online' : 'Offline', // Display online status
//                       style: TextStyle(
//                         color: isOnline ? Colors.green : Colors.red,
//                       ),
//                     ),
//                     Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                       Text(
//                         messageText,
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                     ]),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         systemOverlayStyle: SystemUiOverlayStyle(
//           // Status bar color
//           statusBarColor: primaryColor.value,
//           // Status bar brightness (optional)
//           statusBarIconBrightness: Brightness.light,
//           statusBarBrightness: Brightness.dark,
//         ),
//         title: const ListTile(
//             title: Center(
//           child: Text("Direct Message"),
//         )),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20.0, left: 20.0),
//             child: IconButton(
//               onPressed: () {
//                 // Handle the additional action for the list icon
//               },
//               icon: const Icon(Icons.settings),
//             ),
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(1.0), // Height of the shadow
//           child: Container(
//             height: 2.0, // Thickness of the shadow line
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1), // Shadow color
//                   blurRadius: 0.4, // Blur effect
//                   offset:
//                       const Offset(0, 2), // Shadow direction (offset downwards)
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             const Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                     padding:
//                         EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
//                     child: Text(
//                       "Frequently Contacted",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//                     ))
//               ],
//             ),
//             // Add any other widgets here
//             _contentSendMoney(), // Your custom horizontal scroll widget

//             // Display the user list (scrollable)
//             _isShowUser
//                 ? ListView.builder(
//                     shrinkWrap:
//                         true, // Makes the ListView take only the required space
//                     itemCount:
//                         mockUsers.length, // Using mock data instead of Firebase
//                     itemBuilder: (context, index) {
//                       var user = mockUsers[index];
//                       return UserList(
//                         id: user['id'],
//                         name: user['name'],
//                         imageUrl: user['img'],
//                         isOnline: user['is_Online'],
//                         star: user['rating'],
//                         messageText: user['medicalField'],
//                       );
//                     },
//                   )
//                 : ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: mockUsers.length,
//                     itemBuilder: (context, index) {
//                       var user = mockUsers[index];
//                       return UserList(
//                         id: user['id'],
//                         name: user['name'],
//                         imageUrl: user['img'],
//                         isOnline: user['is_Online'],
//                         star: user['rating'],
//                         messageText: user['medicalField'],
//                       );
//                     },
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _buildAvatarContainer(String avatarAsset) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       const SizedBox(
//         height: 20,
//       ),
//       Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(color: const Color(0xffD8D9E4)),
//         ),
//         child: CircleAvatar(
//           backgroundImage: AssetImage(avatarAsset), // Set the image
//           maxRadius: 30,
//         ),
//       ),
//     ],
//   );
// }

// Widget _contentSendMoney() {
//   return SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       children: <Widget>[
//         _buildAvatarContainer('images/user.png'),
//         const SizedBox(
//           width: 20,
//         ),
//         _buildAvatarContainer('images/user2.png'),
//         const SizedBox(
//           width: 20,
//         ),
//         _buildAvatarContainer('images/user3.png'),
//         const SizedBox(
//           width: 20,
//         ),
//         _buildAvatarContainer('images/user4.png'),
//         const SizedBox(
//           width: 20,
//         ),
//         _buildAvatarContainer('images/user5.png'),
//         const SizedBox(
//           width: 20,
//         ),
//         _buildAvatarContainer('images/user.png'),
//         const SizedBox(
//           width: 20,
//         ),
//         _buildAvatarContainer('images/user.png'),
//       ],
//     ),
//   );
// }
