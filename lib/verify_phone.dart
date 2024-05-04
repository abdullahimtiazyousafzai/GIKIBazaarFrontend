import 'package:flutter/material.dart';
import 'package:gikiolx2/signup.dart';

class VerifyPhone extends StatefulWidget {
  final String phoneNumber;
  final String phoneVerification;
  final Function(String) updateVerification; // Callback function

  const VerifyPhone({
    Key? key,
    required this.phoneNumber,
    required this.phoneVerification,
    required this.updateVerification, // Receive callback function
  }) : super(key: key);


  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                                SizedBox(height: 100), // Adjust the top padding to match login page
                                Image.asset(
                                  'assets/images/logo.png',
                                  width: 150,
                                ),
                                SizedBox(height: 20),
                                const Text(
                                  "Verify Phone",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "A 4-digit OTP has been sent to ${widget.phoneNumber}. Please enter the OTP to verify your phone number.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _otpController,
                        style: TextStyle(color: Colors.white),
                        maxLength: 4, // Limit input length to 4 characters
                        keyboardType: TextInputType.number, // Set keyboard type to number
                        decoration: InputDecoration(
                          labelText: 'OTP',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      ),
                      onPressed: () {
                        // Implement the verification logic
                        if (_otpController.text == '1234') {
                          // Change the value of phoneVerification
                          widget.updateVerification('true');
                          // Navigate back to the Signup page
                          Navigator.pop(context);
                        } else {
                          // OTP is incorrect, show an error message
                        }
                      },
                      child: const Text('Verify',style: TextStyle(color: Colors.white),),
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
