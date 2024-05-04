import 'package:flutter/material.dart';
import 'package:gikiolx2/profile.dart';
import 'package:gikiolx2/chats.dart';
import 'package:gikiolx2/home.dart'; // Importing Home page for navigation purposes
import 'package:gikiolx2/selected_ad.dart';
import 'package:gikiolx2/sell.dart';

class MyAds extends StatefulWidget {
  final String phoneNumber;

  const MyAds({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _MyAdsState createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1F33),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Placeholder for user ads
            // You can replace this with the actual ad cards
            buildAdCard(
              image: 'assets/images/testad.png',
              title: 'Sample Ad',
              price: '\$100',
            ),
            // Add more ad cards as needed
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1A1F33),
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(phoneNumber: widget.phoneNumber)));
                },
              icon: Icon(Icons.home, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatsPage(phoneNumber: widget.phoneNumber)));
              },
              icon: Icon(Icons.chat, color: Colors.white),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
              child: IconButton(
                onPressed: () {
                  // Implement Add button action
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sell(phoneNumber: widget.phoneNumber)));
                },
                icon: Icon(Icons.add, color: Color(0xFF1A1F33)),
              ),
            ),
            IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.add_alert_sharp, color: Colors.yellow),
            ),
            IconButton(
              onPressed: () {
                //replace profile
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile(phoneNumber: widget.phoneNumber)));
              },
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build a card with an image, title, and price
  Widget buildAdCard(
      {required String image, required String title, required String price}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            SelectedAdPage(phoneNumber: widget.phoneNumber,)));
      },
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFF242A3E), // Card background color
        ),
        child: Row(
          children: [
            // Left half of the card for image
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
            ),
            // Right half of the card for title and price
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Price: $price',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}