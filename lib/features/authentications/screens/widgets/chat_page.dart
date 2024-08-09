
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../modules/chat.dart';
import 'chat_detail_page.dart';
import 'chat_search_delegate.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Chat> chats = [
    Chat(name: 'hiba'.tr, message: '', time: '1:45 PM', unreadMessages: 2, imageUrl: 'assets/images/onboarding-images/on.3.png'),
    Chat(name: 'leen'.tr, message: '', time: '12:30 PM', unreadMessages: 0, imageUrl: 'assets/images/onboarding-images/on.3.png'),
    Chat(name: 'Solaf'.tr, message: '', time: '11:20 AM', unreadMessages: 0, imageUrl: 'assets/images/onboarding-images/on.3.png'),
    Chat(name: 'katia'.tr, message: '', time: '10:05 AM', unreadMessages: 1, imageUrl: 'assets/images/onboarding-images/on.3.png'),
  ];

  final ValueNotifier<List<Chat>> filteredChatsNotifier = ValueNotifier<List<Chat>>([]);

  @override
  void initState() {
    super.initState();
    filteredChatsNotifier.value = List.from(chats);
  }

  void _openChatDetail(Chat chat) async {
    // Reset unread messages count
    chat.unreadMessages = 0;

    final updatedMessages = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailPage(chat: chat, chats: chats, filteredChatsNotifier: filteredChatsNotifier),
      ),
    );

    if (updatedMessages != null && updatedMessages is List<String>) {

      setState(() {
        chat.message = updatedMessages.last;
        chat.time = DateFormat.jm().format(DateTime.now());
        filteredChatsNotifier.value = List.from(chats);
      });
    } else {

      setState(() {
        filteredChatsNotifier.value = List.from(chats);
      });
    }
  }

  void _filterChats(String query) {
    filteredChatsNotifier.value = chats.where((chat) {
      final nameLower = chat.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('chats'.tr),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ChatSearchDelegate(chats, _filterChats),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Chat>>(
        valueListenable: filteredChatsNotifier,
        builder: (context, filteredChats, _) {
          return ListView.builder(
            itemCount: filteredChats.length,
            itemBuilder: (context, index) {
              return Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () => _openChatDetail(filteredChats[index]),
                    child: Hero(
                      tag: 'chat_${filteredChats[index].name}',
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(filteredChats[index].imageUrl),
                              backgroundColor: Theme.of(context).cardColor,
                            ),
                            title: Text(filteredChats[index].name, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
                            subtitle: Text(filteredChats[index].message, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(filteredChats[index].time, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color)),
                                if (filteredChats[index].unreadMessages > 0)
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Theme.of(context).hintColor,
                                    child: Text(
                                      filteredChats[index].unreadMessages.toString(),
                                      style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color, fontSize: 12),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

