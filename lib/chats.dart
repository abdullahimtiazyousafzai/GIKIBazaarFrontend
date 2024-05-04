import 'package:flutter/material.dart';
import 'package:gikiolx2/home.dart';
import 'package:gikiolx2/chat_single.dart';
import 'package:gikiolx2/my_ads.dart';
import 'package:gikiolx2/profile.dart';
import 'package:gikiolx2/sell.dart';

class ChatsPage extends StatefulWidget {
  final String phoneNumber;

  const ChatsPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
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
        backgroundColor: Colors.transparent, // Darker shade of blue
        elevation: 10,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            buildChatItem(
              sender: 'John Doe',
              message: 'Hey there! How are you?',
              time: '10:30 AM',
              unreadCount: 2,
            ),
            buildChatItem(
              sender: 'Jane Smith',
              message: 'Meeting at 2 PM today.',
              time: 'Yesterday',
              unreadCount: 0,
            ),
            buildChatItem(
              sender: 'Alice',
              message: 'Check out this new app!',
              time: '2 days ago',
              unreadCount: 0,
            ),
            // Add more chat items as needed
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1A1F33), // Slightly lighter shade of blue
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                // Implement Home button action
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(phoneNumber: widget.phoneNumber),
                  ),
                );
              },
              icon: Icon(Icons.home, color: Colors.white), // White icon
            ),
            IconButton(
              onPressed: () {
                // Implement Chats button action
              },
              icon: Icon(Icons.chat, color: Colors.yellow), // Yellow icon
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow, // Yellow color
              ),
              child: IconButton(
                onPressed: () {
                  // Implement Add button action
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sell(phoneNumber: widget.phoneNumber),
                    ),
                  );
                },
                icon: Icon(
                    Icons.add, color: Color(0xFF1A1F33)), // Dark blue icon
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAds(phoneNumber: widget.phoneNumber),
                  ),
                );
              },
              icon: Icon(
                  Icons.add_alert_sharp, color: Colors.white), // White icon
            ),
            IconButton(
              onPressed: () {
                // Implement Profile button action
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(phoneNumber: widget.phoneNumber),
                  ),
                );
              },
              icon: Icon(Icons.person, color: Colors.white), // White icon
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChatItem(
      {required String sender, required String message, required String time, required int unreadCount}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: () {
          // Define the action to perform when chat item is clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatSingle(phoneNumber: widget.phoneNumber,)),
          );
          print('Chat item clicked: $sender');
        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/profile_picture.png'),
          ),
          title: Text(
            sender,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(color: Colors.grey),
              ),
              if (unreadCount > 0)
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    unreadCount.toString(),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}