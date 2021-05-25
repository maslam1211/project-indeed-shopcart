import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'package:projectshoopingcart/Catergory.dart';
import 'package:projectshoopingcart/loginpage.dart';
import 'package:projectshoopingcart/productsshop.dart';
import 'package:projectshoopingcart/singn%20up.dart';
import 'homepage.dart';

class Drawers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return
     Drawer(elevation: 10,
      child: Container(color: Colours.grey,child:ListView(
        children: [
          Column(
            children: [
              Container(
                  color: Colors.brown,
                  height: 100,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "images/logo.png",
                            fit: BoxFit.cover,
                            height: 70,
                            width: 150,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Container(
            height: 45,
            child: ListTile(
              title: Text(
                "Home",
                style: TextStyle(fontSize: 15,color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homepage()));
              },
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            height: 40,
            child: ListTile(
              title: Text(
                "Categories",
                style: TextStyle(fontSize: 15,color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => cateshop()));
              },
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            height: 40,
            child: ListTile(
              title: Text(
                "Products",
                style: TextStyle(fontSize: 15,color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => product()));
              },
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            height: 40,
            child: ListTile(
              title: Text(
                "Login",
                style: TextStyle(fontSize: 15,color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => login()));
              },
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            height: 40,
            child: ListTile(
              title: Text(
                "Sign up",
                style: TextStyle(fontSize: 15,color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
              },
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            height: 40,
            child: ListTile(
              title: Text(
                "Change Language",
                style: TextStyle(fontSize: 15,color: Colors.white),
              ),
              onTap: () {
                print("1");
              },
            ),
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),

      ),
  );
  }
}
