import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:gikiolx2/verify_phone.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  String phoneVerification = 'false';

  File? _image; // Variable to hold the selected image file

  bool _passwordVisible = false; // Flag to toggle password visibility
  bool _confirmPasswordVisible = false; // Flag to toggle confirm password visibility

  // Function to pick an image from gallery
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
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

  // Callback function to update phoneVerification variable
  void updatePhoneVerification(String newValue) {
    setState(() {
      phoneVerification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    SizedBox(height: 100),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 150,
                    ),
                    SizedBox(height: 20),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
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
                            borderSide: BorderSide(color: Colors.indigo, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:  Colors.indigo, // Change border color based on equality
                              width: 2,
                            ),
                          ),
                          focusedBorder: _confirmPasswordController.text == _passwordController.text ?UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2),
                          ) : UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible; // Toggle password visibility
                              });
                            },
                          ),
                        ),
                        obscureText: !_passwordVisible,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _confirmPasswordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.indigo, // Change border color based on equality
                              width: 2,
                            ),
                          ),
                          focusedBorder: _confirmPasswordController.text == _passwordController.text ?UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2),
                          ) : UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmPasswordVisible = !_confirmPasswordVisible; // Toggle confirm password visibility
                              });
                            },
                          ),
                        ),
                        obscureText: !_confirmPasswordVisible,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: IntlPhoneField(
                        controller: _phoneNumberController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2),
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          suffixIcon: Icon(
                            phoneVerification == 'false' ? Icons.not_interested_sharp : Icons.verified_sharp,
                            color: phoneVerification == 'false' ? Colors.red : Colors.green,
                          ),
                        ),
                        initialCountryCode: 'PK',
                        cursorColor: Colors.white,
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ),
                    Container(
                      width: 300,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            _phoneNumberController.text.isNotEmpty
                                ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyPhone(
                                  phoneNumber: _phoneNumberController.text,
                                  phoneVerification: phoneVerification,
                                  updateVerification: updatePhoneVerification,
                                ),
                              ),
                            )
                                : null;
                          },
                          child: Text(
                            'Verify Phone Number',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _image == null ? Colors.blue : Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () async {
                        await _showImageSourceDialog();
                      },
                      icon: Icon(Icons.upload, color: Colors.white),
                      label: Text(
                        _image == null ? 'Upload Picture' : 'Picture Uploaded',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
                          // Add your signup logic here
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}