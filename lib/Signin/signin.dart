// ignore_for_file: unused_field, unused_local_variable

import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final email="smitdesai200@gmail.com";
  final password="001122";
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sign In'),
            content: Text('Sign in successfully!'),
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
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.teal,
                    ),
                  ),
                 Padding(
                  padding: const EdgeInsets.all(15.0),
                   child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                                return 'Please enter Valid password';
                              }
                              return null;
                            },
                          ),
                      new SizedBox(
                      height: 20.0,
                      ),
                      Padding(padding: const EdgeInsets.only(left: 210.0),
                      child: GestureDetector(
                        onTap: ()=>Navigator.of(context).pushNamed("/forget"),
                        child: new Text("Forget Password?")),
                      )
                ],
                ),
              ),
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
                                "Sign in",
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
              ),
              ),
    );
  }
}