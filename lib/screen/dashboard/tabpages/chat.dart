// ignore_for_file: must_be_immutable, unused_import, duplicate_ignore
import 'package:event_app/global/global.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:event_app/helpers/screen_navigation.dart';
import 'package:event_app/constant/colors.dart';
import 'package:event_app/model/chatmodel.dart';

class MyChatApp extends StatefulWidget {
  String? userId;
  String? name;
  String? img;
  bool isOnline;

  MyChatApp(
      {super.key,
      required this.userId,
      required this.name,
      required this.img,
      required this.isOnline});

  @override
  MyChatAppState createState() => MyChatAppState();
}

class MyChatAppState extends State<MyChatApp> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  TextEditingController textEditingController = TextEditingController();
  late String senderMessage, receiverMessage;

  ScrollController scrollController = ScrollController();

  Future<void> scrollAnimation() async {
    return await Future.delayed(
        const Duration(milliseconds: 100),
        () => scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_BACKGROUND,
      appBar: AppBar(
        backgroundColor: white,
        leadingWidth: 50.0,
        titleSpacing: -8.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            "images/user.png",
            width: 120,
            height: 120,
          ),
        ),
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
        title: ListTile(
          title: Text("${widget.name}",
              style: const TextStyle(
                color: Color.fromARGB(255, 5, 5, 5),
              )),
          subtitle: Text(
            widget.isOnline ? 'Online' : 'Offline',
            style: TextStyle(
              color: widget.isOnline ? Colors.green : Colors.red,
            ),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))),
        ],
      ),
      body: Column(
  children: [
    Expanded(child: ChatListView(scrollController: scrollController)),
    
    Container(
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color.fromARGB(171, 65, 78, 74),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Row(
        children: [
          // Expanded TextFormField
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 50.0), // Adjust left and right padding
              child: TextFormField(
                controller: textEditingController,
                cursorColor: Colors.white,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 6,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Adjust inner padding
                ),
              ),
            ),
          ),

          // Send Icon (outside the TextFormField)
          Padding(
            padding: const EdgeInsets.only(right: 8.0), // Space between the text field and the icon
            child: GestureDetector(
              onTap: () {
                // Handle send action
              },
              onLongPress: () {
                // Handle long press
              },
              child: Transform.rotate(
                angle: -3.14 / 5, // Slightly rotate the icon
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
)
    );
  }
}

class ChatListView extends StatelessWidget {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  ChatListView({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
          child: Align(
            alignment: (messages[index].messageType == "receiver"
                ? Alignment.topLeft
                : Alignment.topRight),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: (messages[index].messageType == "receiver"
                    ? Colors.grey.shade200
                    : Colors.blue[200]),
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                messages[index].messageContent,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SenderRowView extends StatelessWidget {
  const SenderRowView({super.key, required this.senderMessage});

  final String senderMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 15,
          fit: FlexFit.tight,
          child: Container(
            width: 50.0,
          ),
        ),
        Flexible(
          flex: 72,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Wrap(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 8.0, right: 5.0, top: 8.0, bottom: 2.0),
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 9.0, bottom: 9.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFF7CE994),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      senderMessage,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 10.0, bottom: 8.0),
                child: const Text(
                  '8:55 AM, Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 7.0,
                  ),
                ),
              ),
            ],
          ),
          //
        ),
        const Flexible(
          flex: 13,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(right: 10.0, top: 1.0, bottom: 9.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFF90C953),
              child: Text('A',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
        )
      ],
    );
  }
}

class ReceiverRowView extends StatelessWidget {
  const ReceiverRowView({super.key, required this.receiverMessage});

  final String receiverMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Flexible(
          flex: 13,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(left: 10.0, top: 1.0, bottom: 9.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFF90C953),
              child: Text('X',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        Flexible(
          flex: 72,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5.0, right: 8.0, top: 8.0, bottom: 2.0),
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 9.0, bottom: 9.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFF87D4E6),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      receiverMessage,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                child: const Text(
                  '8:55 AM, Today',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 7.0,
                  ),
                ),
              ),
            ],
          ),
          //
        ),
        Flexible(
          flex: 15,
          fit: FlexFit.tight,
          child: Container(
            width: 50.0,
          ),
        ),
      ],
    );
  }
}
