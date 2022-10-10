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
      message: 'message',
      isMe: true,
      sendTime: DateTime(2022, 10, 1, 0),
    ),
    Message(
      message: 'message',
      isMe: false,
      sendTime: DateTime(2022, 10, 2, 12),
    ),
    Message(
      message: 'message',
      isMe: false,
      sendTime: DateTime(2022, 10, 2, 12),
    ),
    Message(
      message: 'message',
      isMe: false,
      sendTime: DateTime(2022, 10, 2, 12),
    ),
    Message(
      message: 'message',
      isMe: true,
      sendTime: DateTime(2022, 10, 2, 12),
    ),
    Message(
      message: 'message',
      isMe: false,
      sendTime: DateTime(2022, 10, 2, 12),
    ),
    Message(
      message: 'message',
      isMe: false,
      sendTime: DateTime(2022, 10, 2, 14),
    ),
    Message(
      message: 'message',
      isMe: true,
      sendTime: DateTime(2022, 10, 2, 14),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const RangeMaintainingScrollPhysics(),
                shrinkWrap: true,
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            color: messageList[index].isMe
                                ? Colors.green
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          child: Text('${messageList[index].message} $index'),
                        ),
                        Text(
                          intl.DateFormat('HH:mm')
                              .format(messageList[index].sendTime),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.white,
                  height: 60,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
