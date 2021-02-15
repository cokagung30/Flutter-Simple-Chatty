import 'package:bwa_chatty/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:bwa_chatty/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 28,
        ),
        backgroundColor: greenColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/images/profile_pic.png',
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Sabrina Carpenter",
                style: nameUserTextStyle,
              ),
              Text(
                "Travel Freelancer",
                style: jobUserTextStyle,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Friends",
                      style: titleTextStyle,
                    ),
                    ChatTile(
                      imageUrl: 'assets/images/person1.png',
                      name: "Joshuer",
                      message: 'Sorry, you’re not my ty...',
                      time: 'Now',
                      unRead: true,
                    ),
                    ChatTile(
                      imageUrl: 'assets/images/person2.png',
                      name: "Gabriella",
                      message: 'I saw it clearly and mig...',
                      time: '2:30',
                      unRead: false,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Groups",
                      style: titleTextStyle,
                    ),
                    ChatTile(
                      imageUrl: 'assets/images/group1.png',
                      name: 'Jakarta Fair',
                      message: 'Why does everyone ca...',
                      time: '11.11',
                      unRead: false,
                    ),
                    ChatTile(
                      imageUrl: 'assets/images/group2.png',
                      name: 'Angga',
                      message: 'Here here we can go...',
                      time: '7.11',
                      unRead: true,
                    ),
                    ChatTile(
                      imageUrl: 'assets/images/group3.png',
                      name: 'Bentley',
                      message: 'The car which does not...',
                      time: '11.11',
                      unRead: true,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
