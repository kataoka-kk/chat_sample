import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../model/message.dart';

class TalkRoomPage extends StatefulWidget {
  const TalkRoomPage(this.name, {Key? key}) : super(key: key);

  final String name;

  @override
  State<TalkRoomPage> createState() => _TalkRoomPageState();
}

class _TalkRoomPageState extends State<TalkRoomPage> {
  List<Message> messageList = [
    Message(
      message: 'message1',
      isMe: true,
      sendTime: DateTime(2022, 10, 1, 0),
    ),
    Message(
      message: 'message2',
      isMe: false,
      sendTime: DateTime(2022, 10, 2, 12),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: ListView.builder(
        physics: const RangeMaintainingScrollPhysics(),
        shrinkWrap: true,
        reverse: true,
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              left: 12.0,
              right: 12.0,
              bottom: index == 0 ? 10 : 0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              textDirection: messageList[index].isMe
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  decoration: BoxDecoration(
                    color:
                        messageList[index].isMe ? Colors.green : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Text(messageList[index].message),
                ),
                Text(
                  intl.DateFormat('HH:mm').format(messageList[index].sendTime),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
