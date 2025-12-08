import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/message_bubble.dart';
import 'dart:async';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [];
  final controller = TextEditingController();
  final scrollController = ScrollController();

  final List<String> botReplies = [
    "THIS IS AN AUTOMATED MESSAGE FROM THE APP",
    "THIS IS AN AUTOMATED MESSAGE FROM THE APP",
    "THIS IS AN AUTOMATED MESSAGE FROM THE APP",
    "THIS IS AN AUTOMATED MESSAGE FROM THE APP",
    "THIS IS AN AUTOMATED MESSAGE FROM THE APP",
  ];

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 200), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void sendMessage() {
    if (controller.text.isEmpty) return;

    setState(() {
      messages.add(
        Message(text: controller.text, isMe: true, time: DateTime.now()),
      );
    });

    scrollToBottom();
    controller.clear();
    simulateBotReply();
  }

  void simulateBotReply() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages.add(
          Message(
            text: botReplies[DateTime.now().millisecond % botReplies.length],
            isMe: false,
            time: DateTime.now(),
          ),
        );
      });
      scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messaging Interface")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (_, i) => MessageBubble(message: messages[i]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onSubmitted: (_) => sendMessage(),
                    decoration: const InputDecoration(
                      hintText: "Send Text",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
