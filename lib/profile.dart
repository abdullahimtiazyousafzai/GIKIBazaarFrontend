import 'package:flutter/material.dart';
import 'package:gikiolx2/home.dart';
import 'package:gikiolx2/chats.dart';
import 'package:gikiolx2/my_ads.dart';
import 'package:gikiolx2/sell.dart';

class Profile extends StatefulWidget {
  final String phoneNumber;
  const Profile({Key? key,required this.phoneNumber}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1A1F33), // Slightly lighter shade of blue
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                // Implement Home button action
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(phoneNumber: widget.phoneNumber)));
              },
              icon: Icon(Icons.home, color: Colors.white), // White icon
            ),
            IconButton(
              onPressed: () {
                // Implement Chat button action
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatsPage(phoneNumber: widget.phoneNumber)));
              },
              icon: Icon(Icons.chat, color: Colors.white), // White icon
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sell(phoneNumber: widget.phoneNumber)));
                },
                icon: Icon(Icons.add, color: Color(0xFF1A1F33)), // Dark blue icon
              ),
            ),
            IconButton(
              onPressed: () {
                // Implement Chat button action
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyAds(phoneNumber: widget.phoneNumber)));
              },
              icon: Icon(Icons.add_alert_sharp, color: Colors.white), // White icon
            ),
            IconButton(
              onPressed: () {
                //current page
              },
              icon: Icon(Icons.person, color: Colors.yellow),
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  // Circular Logo for Profile Picture
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/profile_picture.png'),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 36),
                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        buildEditableRow(Icons.person, "Name", "Adolf Hitler"),
                        buildEditableRow(Icons.email, "Email", "ilovegermany@ph.com"),
                        buildEditableRow(Icons.phone, "Phone", "1234567890"),
                        buildEditableRow(Icons.lock, "Change Password", "********"),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Add logout functionality here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // Rounded corners
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                            child: Text(
                              "Logout",
                              style: TextStyle(fontSize: 16,color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build a row with an icon, title, and editable value
  Widget buildEditableRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              _showEditDialog(title, value);
            },
            child: Row(
              children: [
                Text(
                  value,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 5),
                Icon(Icons.edit, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to show a dialog for editing the value
  void _showEditDialog(String title, String currentValue) {
    TextEditingController _textFieldController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF1A1F33),
          title: Text(
            "Edit $title",
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: _textFieldController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter new $title",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'CANCEL',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Here you can update the value and dismiss the dialog
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Text color
              ),
              child: Text('SAVE',style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }
}
