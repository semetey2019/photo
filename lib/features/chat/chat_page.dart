import 'package:flutter/material.dart';
import 'package:photo/features/main/presentation/pages/home/chat/discussion_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.grey.withOpacity(.6),
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DiscussionPage()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  leading: Image.asset(
                    'assets/profile/ellips${index + 1}.png',
                  ),
                  title: Text(
                    continentsList[index].name,
                    style: const TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    continentsList[index].description,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

var chats = <String>[
  'assets/profile/ellips1.png',
  'assets/profile/ellips2.png',
  'assets/profile/ellips3.png',
  'assets/profile/ellips4png',
];

class ChatView {
  const ChatView({required this.name, required this.description});
  final String name;

  final String description;
}

const ChatView asia =
    ChatView(name: 'James', description: "Thank you! That was very helpful!");
const ChatView africa = ChatView(
    name: 'Will Kenny', description: "I know... I’m trying to get the funds.");
const ChatView america = ChatView(
    name: 'Beth Williams',
    description:
        "I’m looking for tips around capturing the milky way. I have a 6D with a 24-100mm...");
const ChatView europe = ChatView(
    name: 'Rev Shawn',
    description:
        "Wanted to ask if you’re available for a portrait shoot next week.");

List<ChatView> continentsList = [asia, america, europe, africa];
