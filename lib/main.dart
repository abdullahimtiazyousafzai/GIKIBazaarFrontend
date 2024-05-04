import 'package:flutter/material.dart';
import 'package:gikiolx2/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLoggedIn = false; // Set this variable based on the login status

  runApp(MaterialApp(
    title: 'GIKI OLX',
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => Login(),
      // Add the route for the main page
    },
  ));
}
