import 'package:flutter/material.dart';
import 'package:bwa_chatty/theme.dart';

class ChatTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String message;
  final String time;
  final bool unRead;

  ChatTile({this.imageUrl, this.name, this.message, this.time, this.unRead});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imageUrl,
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
                    name,
                    style: userSendMessageTextStyle,
                  ),
                  Text(
                    message,
                    style: messageTextStyle.copyWith(
                        color: (unRead) ? blackColor : darkGreyColor),
                  )
                ],
              ),
            ],
          ),
          Text(
            time,
            style: timeReceiveMessageTextStyle,
          )
        ],
      ),
    );
  }
}
