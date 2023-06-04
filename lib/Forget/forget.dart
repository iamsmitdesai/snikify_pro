// ignore_for_file: unused_local_variable, unused_field

import 'package:flutter/material.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final oldpassword="001122";
  final _formKey = GlobalKey<FormState>();
  TextEditingController _oldpasswordController = TextEditingController();
  bool _oldpasswordVisible = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String oldpassword = _oldpasswordController.text;

      _oldpasswordController.clear();
       Navigator.of(context).pushNamed("/newpassword");
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
                        controller: _oldpasswordController,
                        obscureText: !_oldpasswordVisible,
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
                              _oldpasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.teal,
                            ),
                            onPressed: () {
                              setState(() {
                                _oldpasswordVisible = !_oldpasswordVisible;
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
                          else if (value!=oldpassword) {
                          return 'Please enter Valid  Password';
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
                        child:new Container(
                        height: 40.0,
                        width: 40.0,
                        child:ElevatedButton(
                        onPressed: ()=>{
                          _submitForm()
                        },
                          child: new Icon(Icons.login,color: Colors.white,)),

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
