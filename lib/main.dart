// @dart=2.9
import 'package:flutter/material.dart';
import 'package:projectshoopingcart/Catergory.dart';
import 'package:projectshoopingcart/loginpage.dart';
import 'package:projectshoopingcart/productsshop.dart';

import 'package:projectshoopingcart/shopbycategory.dart';
import 'package:projectshoopingcart/singn%20up.dart';

import 'package:projectshoopingcart/trendingproducts.dart';
import 'homepage.dart';
import 'package:colours/colours.dart';
import 'Stor.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}

class MyHomePage extends StatefulWidget {




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
    );


  }
}
