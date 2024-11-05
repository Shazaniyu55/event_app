// ignore_for_file: use_build_context_synchronously
import 'package:event_app/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}



// Dummy data
class _ProfileState extends State<Profile> {
  var userData = {
    'username': 'john_doe',
    'photoUrl': 'https://example.com/profile_pic.jpg',
    'bio': 'This is the bio text.',
    'followers': ['user1', 'user2', 'user3'],
    'following': ['user4', 'user5'],
    'uid': 'user123',
  };

  int postLen = 100; // Dummy number of posts
  int followers = 3; // Dummy number of followers
  int following = 2; // Dummy number of following
  bool isFollowing = false; // Dummy follow status

  bool isLoading = false;

  // Simulate the current user (we're assuming user123 is logged in)
  var currentUser = {'uid': 'user123', 'username': 'current_user'};

  @override
  void initState() {
    super.initState();
    getData();
  }

  // Simulate getting data with a delay
  getData() async {
    setState(() {
      isLoading = true;
    });

    // Simulating some delay for loading data (like network call)
    await Future.delayed(const Duration(seconds: 2));

    // You can modify the `userData` or any of these values if you want to test different data scenarios.
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
          decoration: BoxDecoration(
        gradient: appBgGradient,
      ),
          child: Scaffold(
              appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: primaryColor.value,
            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
                title: const Center(
                  child: Text("John"),
                ), 
                centerTitle: false,
              ),
              body: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Colors.white, Color.fromARGB(238, 172, 245, 175)], // Customize colors
                ),
              ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.grey,
                                backgroundImage: AssetImage("images/user3.png"),
                                radius: 40,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        buildStatColumn(postLen, "posts"),
                                        buildStatColumn(followers, "followers"),
                                        buildStatColumn(following, "following"),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // Simulate Sign Out or Follow/Unfollow button
                                        
                                            FollowButton(
                                                    text: 'Follow',
                                                    backgroundColor: primaryColor.value,
                                                    textColor: white,
                                                    borderColor: Colors.grey,
                                                    function: () {
                                                      setState(() {
                                                        isFollowing = false;
                                                        followers--;
                                                      });
                                                    },
                                                  ),
                                                 FollowButton(
                                                    text: 'Message',
                                                    backgroundColor: white,
                                                    textColor: primaryColor.value,
                                                    borderColor: primaryColor.value,
                                                    function: () {
                                                      setState(() {
                                                        isFollowing = true;
                                                        followers++;
                                                      });
                                                    },
                                                  ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(top: 15),
                            child: const Text(
                              "john",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(top: 1),
                            child: const Text("i love fish"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: postLen,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 1.5,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      // Dummy post data
                      return SizedBox(
                        child: Image.asset(
                          'images/user4.png',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
        );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

class FollowButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback function;

  const FollowButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
        
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
      child: Text(text, style: TextStyle(color: textColor),),
    );
  }
}
