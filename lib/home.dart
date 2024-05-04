import 'package:flutter/material.dart';
import 'package:gikiolx2/profile.dart';
import 'package:gikiolx2/chats.dart';
import 'package:gikiolx2/my_ads.dart';
import 'package:gikiolx2/selected_ad.dart';
import 'package:gikiolx2/sell.dart';

class Home extends StatefulWidget {
  final String phoneNumber;

  const Home({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selectedCategory = 'All'; // Initial selected category for dropdown
  List<String> _categories = [
    'All',
    'Electronics',
    'Vehicles',
    'Real Estate',
    'Jobs'
  ]; // List of ad categories

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1F33),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // Set the height of the app bar
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF1A1F33),
          elevation: 10,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12.0),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Perform search operation
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dummy Card with Placeholder Values
            buildAdCard(
              image: 'assets/images/testad.png',
              title: '1985 Honda Civic',
              price: '\$5,000',
            ),
            buildAdCard(
              image: 'assets/images/testad.png',
              title: '1985 Honda Civic',
              price: '\$5,000',
            ),
            buildAdCard(
              image: 'assets/images/testad.png',
              title: '1985 Honda Civic',
              price: '\$5,000',
            ),
            buildAdCard(
              image: 'assets/images/testad.png',
              title: '1985 Honda Civic',
              price: '\$5,000',
            ),
            buildAdCard(
              image: 'assets/images/testad.png',
              title: '1985 Honda Civic',
              price: '\$5,000',
            ),
            buildAdCard(
              image: 'assets/images/testad.png',
              title: '1985 Honda Civic',
              price: '\$5,000',
            ),
            buildAdCard(
              image: 'assets/images/testad.png',
              title: '1985 Honda Civic',
              price: '\$5,000',
            ),
            buildAdCard(
              image: 'assets/images/testad.png',
              title: '1985 Honda Civic',
              price: '\$5,000',
            ),
            buildAdCard(
              image: 'assets/images/testad.png',
              title: '1985 Honda Civic',
              price: '\$5,000',
            ),
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
                // Implement Home button action
              },
              icon: Icon(Icons.home, color: Colors.yellow),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                    ChatsPage(phoneNumber: widget.phoneNumber)));
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                      Sell(phoneNumber: widget.phoneNumber)));
                },
                icon: Icon(Icons.add, color: Colors.black),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                    MyAds(phoneNumber: widget.phoneNumber)));
              },
              icon: Icon(Icons.add_alert_sharp, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                // Swipe navigation
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                    Profile(phoneNumber: widget.phoneNumber)));
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