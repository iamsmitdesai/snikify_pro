// ignore_for_file: unused_local_variable, unused_field

import 'package:flutter/material.dart';

class newpasswords extends StatefulWidget {
  const newpasswords ({Key? key}) : super(key: key);

  @override
  State<newpasswords> createState() => _newpasswordsState();
}

class _newpasswordsState extends State<newpasswords> {
  final newpassword="";
  final newpasswordconfirmation="";

  final _formKey = GlobalKey<FormState>();
  TextEditingController _newpasswordController = TextEditingController();
  TextEditingController _newpasswordconfirmationController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmpasswordVisible = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String password = _newpasswordController.text;
      String confirmpassword = _newpasswordconfirmationController.text;

      _newpasswordController.clear();
      _newpasswordconfirmationController.clear();

       showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('forget password'),
            content: Text('forget password successfully!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.pushNamed(context, '/signin'); // Navigate to the welcome page
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
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\n\n\n"),
                      Text(
                        "Forget Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _newpasswordController,
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
                          hintText: "new Password",
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
                            return 'Please enter your new password';
                          } else if (value.length < 6) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: _newpasswordconfirmationController,
                        obscureText: !_confirmpasswordVisible,
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
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock, color: Colors.teal),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmpasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.teal,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmpasswordVisible = !_confirmpasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your confirm password';
                          } else if (value.length < 6) {
                            return 'Please enter a valid confirm password';
                          } else if (value != _newpasswordController.text) {
                            return 'Passwords do not match';
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
                          onPressed:_submitForm,
                          child: Text(
                            "Forget Password",
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
        ),
      ),
    );
  }
}
