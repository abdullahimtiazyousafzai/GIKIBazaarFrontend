import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gikiolx2/profile.dart';
import 'package:gikiolx2/chats.dart';
import 'package:gikiolx2/home.dart'; // Importing Home page for navigation purposes
import 'package:gikiolx2/my_ads.dart';

class Sell extends StatefulWidget {
  final String phoneNumber;

  const Sell({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  List<File> _images = []; // List to hold the selected image files
  bool _availableOnCampus = false; // Flag to indicate availability on campus

  // Function to pick an image from gallery
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  // Function to show dialog for choosing image source
  Future<void> _showImageSourceDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () async {
                    Navigator.pop(context);
                    await _pickImage(ImageSource.gallery);
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () async {
                    Navigator.pop(context);
                    await _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo2.png',
          width: 50,
        ),
        backgroundColor: Colors.transparent,
        elevation: 10,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1A1F33),
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                // Implement Home button action
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(phoneNumber: widget.phoneNumber)));
              },
              icon: Icon(Icons.home, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                // Implement Chat button action
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatsPage(phoneNumber: widget.phoneNumber)));
              },
              icon: Icon(Icons.chat, color: Colors.white),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: () {
                  // Implement Add button action
                },
                icon: Icon(Icons.add, color: Colors.yellow),
              ),
            ),
            IconButton(
              onPressed: () {
                // Implement Chat button action
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyAds(phoneNumber: widget.phoneNumber)));
              },
              icon: Icon(Icons.add_alert_sharp, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                // Swipe navigation
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile(phoneNumber: widget.phoneNumber)));
              },
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF1A1F33),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    const Text(
                      "Sell",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _titleController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _priceController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Price',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _descriptionController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Available on Campus',
                          style: TextStyle(color: Colors.white),
                        ),
                        Switch(
                          value: _availableOnCampus,
                          onChanged: (value) {
                            setState(() {
                              _availableOnCampus = value;
                            });
                          },
                          activeColor: Colors.green,
                          activeTrackColor: Colors.lightGreenAccent,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () async {
                        await _showImageSourceDialog();
                      },
                      icon: Icon(Icons.upload, color: Colors.white),
                      label: Text(
                        'Upload Image',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),
                    _images.isNotEmpty
                        ? Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(_images[index], width: 100),
                          );
                        },
                      ),
                    )
                        : SizedBox.shrink(),
                    SizedBox(height: 20),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // Add your sell logic here
                        },
                        child: Text(
                          'Sell',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
