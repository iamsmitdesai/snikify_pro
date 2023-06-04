import 'package:flutter/material.dart';
import 'package:myapp/Forget/forget.dart';
import 'package:myapp/HomePage/homepage.dart';
import 'package:myapp/NewPassword/newpassword.dart';
import 'package:myapp/Signin/signin.dart';
import 'package:myapp/Welcome/offers.dart';
import 'package:myapp/Welcome/profile.dart';
import 'package:myapp/Welcome/welcome.dart';
import 'package:myapp/mostpopular.dart';
import 'package:myapp/nike.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: new ThemeData(
    primarySwatch: Colors.teal,
    ),
    debugShowCheckedModeBanner: false,
    home: new HomePage(),
    routes: {
    "/welcome":(BuildContext context)=>WelcomePage(),
    "/signin":(BuildContext context)=>signin(),
    "/forget":(BuildContext context)=>Forget(),
    "/newpassword":(BuildContext context)=>newpasswords(),
    "/nike":(BuildContext context)=>nike(),
     "/mostpopular":(BuildContext context)=>MostPopular(),
     "/offers":(BuildContext context)=>Offers(),
     "/profile":(BuildContext context)=>Profile(),
    },
    );
  }
}