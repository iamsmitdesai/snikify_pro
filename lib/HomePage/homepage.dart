// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final email="smitdesai200@gmail.com";
  final password="001122";
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String phoneNumber = _phoneNumberController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      _nameController.clear();
      _phoneNumberController.clear();
      _emailController.clear();
      _passwordController.clear();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Signup'),
            content: Text('Sign up successfully!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.pushNamed(context, '/welcome'); // Navigate to the welcome page
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 800.0,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("\n\n\n"),
                  Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Name",
                              prefixIcon:
                                  Icon(Icons.lightbulb_circle_outlined, color: Colors.teal),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Phone Number",
                              prefixIcon: Icon(Icons.call, color: Colors.teal),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              } else if (value.length != 10) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email_outlined, color: Colors.teal),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              } else if (!value.contains('@')) {
                                return 'Please enter @';
                              } else if (!value.contains(".")) {
                                return 'Please enter .';
                              } else if (!value.contains("com")) {
                                return 'Please enter a valid email';
                              } else if (!value.contains("gmail")) {
                                return 'Please enter a valid email';
                              }
                               else if (value!=email) {
                                return 'Please enter Valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock, color: Colors.teal),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.teal,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Please enter a valid password';
                              }
                               else if (value!=password) {
                                return 'Please enter Valid Password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            height: 45,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.5),
                              color: Colors.teal,
                            ),
                            child: TextButton(
                              onPressed: _submitForm,
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.5,
                        width: 100,
                        color: Colors.teal,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "or Sign up with",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 1.5,
                        width: 100,
                        color: Colors.teal,
                      ),
                    ],
                  ),
                  SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/google.png", height: 40.0),
                      SizedBox(width: 10.0),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.facebook, color: Colors.blue, size: 35),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 84.0),
                    child: Row(
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: ()=>Navigator.of(context).pushNamed("/signin"),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}
