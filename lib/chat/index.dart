import 'package:flutter/material.dart';
import 'package:migrant/chat/chat.dart';
import 'package:migrant/chat/chat_room.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<Chat> chats = [
    Chat(
      userName: 'John Doe',
      lastMessage:
          'Hey, how are you? I am just checking to see if you are doing well',
      time: '12:00',
      avatar: 'https://mighty.tools/mockmind-api/content/human/6.jpg',
      hasNewMessages: true,
    ),
    Chat(
      userName: 'Jane Doe',
      lastMessage: 'Hey',
      time: '11:00',
      avatar: 'https://mighty.tools/mockmind-api/content/human/7.jpg',
      hasNewMessages: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                color: Colors.grey.shade400,
                height: 1,
              ),
            ),
            backgroundColor: Colors.white,
            title: const Text('Messages',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ]),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: chats.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatRoom(
                                    userName: chats[index].userName,
                                    userAvatar: chats[index].avatar,
                                  )),
                        );
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(chats[index].avatar),
                      ),
                      title: Text(chats[index].userName),
                      subtitle: Text(chats[index].lastMessage),
                      trailing: chats[index].hasNewMessages
                          ? Stack(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Text(chats[index].time),
                    );
                  })
            ],
          ),
        ));
  }
}
