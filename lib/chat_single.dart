import 'package:flutter/material.dart';
import 'package:gikiolx2/home.dart';
//will import a time here

class ChatSingle extends StatefulWidget {
  final String phoneNumber;

  const ChatSingle({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _ChatSingleState createState() => _ChatSingleState();
}

class _ChatSingleState extends State<ChatSingle> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _messages = [
    ChatMessage(sender: 'John Doe', message: 'Hey there! How are you?', time: '10:30 AM', isSent: true),
    ChatMessage(sender: 'Jane Smith', message: 'I\'m good. How about you?', time: '10:35 AM', isSent: false),
    ChatMessage(sender: 'John Doe', message: 'Doing well, thanks!', time: '10:40 AM', isSent: true),
    ChatMessage(sender: 'Jane Smith', message: 'That\'s great to hear!', time: '10:45 AM', isSent: false),
    // Add more chat messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1F33), // Dark blue gradient background
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo2.png',
          width: 50,
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 10,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return buildChatItem(_messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFF242A3E),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      _sendMessage(_messageController.text);
                    }
                  },
                  icon: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChatItem(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: message.isSent ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: message.isSent ? Colors.blue : Color(0xFF242A3E),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.sender,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                message.message,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                message.time,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage(String message) {
    setState(() {
      _messages.add(ChatMessage(sender: 'You', message: message, time: _getCurrentTime(), isSent: true));
      _messageController.clear();
    });
  }

  String _getCurrentTime() {
    // Implement logic to get current time in desired format
    return '11:00 AM';
  }
}

class ChatMessage {
  final String sender;
  final String message;
  final String time;
  final bool isSent;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.time,
    required this.isSent,
  });
}
