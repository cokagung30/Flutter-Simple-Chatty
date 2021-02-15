import 'package:bwa_chatty/theme.dart';
import 'package:bwa_chatty/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final List<ChatItem> _messages = [
    ChatItem(
        imageUser: 'assets/images/person2.png',
        message: 'Love them',
        time: '23:11',
        isYou: false),
    ChatItem(
        imageUser: 'assets/images/person4.png',
        message: 'Thinking about how to deal with this client from hell...',
        time: '22:08',
        isYou: true),
    ChatItem(
        imageUser: 'assets/images/person3.png',
        message: 'Find here :P',
        time: '3:11',
        isYou: false),
    ChatItem(
        imageUser: 'assets/images/person1.png',
        message: 'How are ya guys?',
        time: '2:30',
        isYou: false),
  ];
  final _textController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGreyColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 115,
              padding:
                  EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 40),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/group1.png',
                        width: 55,
                        height: 55,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jakarta Fair",
                            style: titleTextStyle,
                          ),
                          Text(
                            "14,209 members",
                            style: messageTextStyle,
                          )
                        ],
                      )
                    ],
                  ),
                  FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: greenColor,
                      elevation: 0,
                      child: Icon(
                        Icons.call,
                        size: 25,
                      ))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return _messages[index];
                },
                itemCount: _messages.length,
                controller: _scrollController,
                reverse: true,
                shrinkWrap: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 15),
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: false,
                        controller: _textController,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Type Message ...',
                            hintStyle: TextStyle(fontSize: 14)),
                      ),
                    ),
                    InkWell(
                      onTap: () => _handleSubmitted(_textController.text),
                      child: Image.asset(
                        'assets/images/btn_send.png',
                        width: 35,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    DateTime now = DateTime.now();

    ChatItem item = ChatItem(
        imageUser: 'assets/images/person4.png',
        message: text,
        time: now.hour.toString() + ':' + now.minute.toString(),
        isYou: true);
    _textController.clear();
    setState(() {
      _messages.insert(0, item);
      _scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }
}
