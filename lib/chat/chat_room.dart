import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:migrant/chat/message.dart';
import 'package:migrant/components/gap.dart';

// ignore: must_be_immutable
class ChatRoom extends StatefulWidget {
  String userName;
  String userAvatar;

  // ignore: non_constant_identifier_names
  ChatRoom({super.key, required this.userName, required this.userAvatar});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  // List<Message> messages = [
  //   Message(
  //       text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
  //       date: DateTime.parse(
  //         "2021-09-01 20:00:00",
  //       ),
  //       isSentByMe: false),
  //   Message(
  //       text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
  //       date: DateTime.now().subtract(const Duration(minutes: 1)),
  //       isSentByMe: false),
  //   Message(
  //       text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
  //       date: DateTime.now().subtract(const Duration(minutes: 1)),
  //       isSentByMe: false),
  //   Message(
  //       text: "text",
  //       date: DateTime.now().subtract(const Duration(minutes: 1)),
  //       isSentByMe: false),
  //   Message(
  //       text: "text",
  //       date: DateTime.now().subtract(const Duration(minutes: 1)),
  //       isSentByMe: true),
  //   Message(
  //       text: "text",
  //       date: DateTime.now().subtract(const Duration(minutes: 1)),
  //       isSentByMe: true),
  //   Message(
  //       text: "text",
  //       date: DateTime.now().subtract(const Duration(minutes: 1)),
  //       isSentByMe: false),
  // ];

  final messages = List<Message>.generate(
      1000,
      (index) => Message(
          // ignore: unnecessary_brace_in_string_interps
          text: "${index}",
          date: DateTime.now().subtract(const Duration(minutes: 1)),
          isSentByMe: index.isEven));
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.userAvatar),
            ),
            title: Text(
              widget.userName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.directions_car_filled_sharp,
                    color: Colors.blueGrey.shade400, size: 16),
                Gap(size: 4),
                Text(
                  "Driver",
                  style: TextStyle(
                      color: Colors.blueGrey.shade400,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  elements: messages,
                  groupBy: (messages) => DateTime(messages.date.year,
                      messages.date.month, messages.date.day),
                  groupHeaderBuilder: (messages) => SizedBox(
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              // color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              DateFormat.yMMMd().format(messages.date),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blueGrey.shade400),
                            ),
                          ),
                        ),
                      ),
                  itemBuilder: (context, messages) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: messages.isSentByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Card(
                          margin: EdgeInsets.fromLTRB(
                              messages.isSentByMe ? 56 : 0,
                              4,
                              messages.isSentByMe ? 0 : 56,
                              4),
                          color: messages.isSentByMe
                              ? Colors.blueGrey
                              : Colors.blueGrey.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              messages.text,
                              style: TextStyle(
                                fontSize: 16,
                                color: messages.isSentByMe
                                    ? Colors.white
                                    : Colors.blueGrey.shade800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.blueGrey.shade200,
                  ),
                )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Gap(size: 16),
                // icon button for send message
                IconButton(
                    onPressed: () {
                      // send message
                      if (_textController.text.isNotEmpty) {
                        setState(() {
                          messages.add(Message(
                              text: _textController.text,
                              date: DateTime.now(),
                              isSentByMe: true));
                          _textController.clear();
                        });
                      }
                    },
                    icon: const Icon(Icons.send))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
