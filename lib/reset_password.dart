import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _retypePasswordController = TextEditingController();
  bool _newPasswordVisible = false;
  bool _retypePasswordVisible = false;
  bool _passwordsMatch = true;

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
                    SizedBox(height: 40),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _newPasswordController,
                        style: TextStyle(color: Colors.white),
                        obscureText: !_newPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _newPasswordVisible = !_newPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _newPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _retypePasswordController,
                        obscureText: !_retypePasswordVisible,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Retype Password',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: _passwordsMatch ? Colors.green : Colors.red,
                              width: 2,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _retypePasswordVisible = !_retypePasswordVisible;
                              });
                            },
                            icon: Icon(
                              _retypePasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _passwordsMatch = value == _newPasswordController.text;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        // Reset password logic here
                      },
                      child: Text('Confirm', style: TextStyle(color: Colors.white)
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
