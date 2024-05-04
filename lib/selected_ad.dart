import 'package:flutter/material.dart';

class SelectedAdPage extends StatefulWidget {
  final String phoneNumber;

  const SelectedAdPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _SelectedAdPageState createState() => _SelectedAdPageState();
}

class _SelectedAdPageState extends State<SelectedAdPage> {
  bool _isSold = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1F33),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF1A1F33),
        elevation: 10,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Images
            Container(
              height: 200, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageContainer('assets/images/testad.png'),
                  _buildImageContainer('assets/images/testad.png'),
                  _buildImageContainer('assets/images/testad.png'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Title, Price, Available/Not on Campus, Delete
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1985 Honda Civic', // Example title
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: \$5,000', // Example price
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Available on Campus', // Example availability
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _showDeleteConfirmationDialog();
                      },
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description:', // Description heading
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', // Example description
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Contact Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Info:', // Contact info heading
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Phone: ${widget.phoneNumber}', // Example phone number
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: example@example.com', // Example email
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Mark as Sold
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Mark as Sold', // Mark as sold text
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  Switch(
                    value: _isSold,
                    onChanged: (value) {
                      _showMarkasSoldConfirmationDialog(value);
                    },
                    activeColor: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(imagePath),
      ),
    );
  }

  Future<void> _showMarkasSoldConfirmationDialog(bool value) async {
    if (value) {
      bool confirm = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text("Are you sure you want to mark this ad as sold?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("CANCEL"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("CONFIRM"),
              ),
            ],
          );
        },
      );
      if (confirm) {
        setState(() {
          _isSold = value;
        });
      }
    } else {
      setState(() {
        _isSold = value;
      });
    }
  }

  Future<void> _showDeleteConfirmationDialog() async {
    bool confirm = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Are you sure you want to delete this ad?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("CANCEL"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("DELETE"),
            ),
          ],
        );
      },
    );
    if (confirm) {
      // Implement delete functionality
    }
  }
}
