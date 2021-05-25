import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'package:projectshoopingcart/loginpage.dart';
import 'drawer.dart';

class signup extends StatefulWidget {
  const signup({Key key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  bool zname=false;
  final _formkey = GlobalKey<FormState>();
  TextEditingController name=new TextEditingController();
  TextEditingController lastname=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController mobile=new TextEditingController();
  TextEditingController password=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colours.lightSlateGrey,
      appBar: AppBar(
        backgroundColor: Colours.grey,
        toolbarHeight: 70,
        centerTitle: true,
        title: Container(
            height: 48,
            width: 190,
            child: FittedBox(
              child: Row(
                children: [
                  Container(
                    width: 190,
                    height: 38,
                    color: Colors.white,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "  Search Products ",
                        suffixIcon: Container(
                          height: 20,
                          child: IconButton(
                              alignment: Alignment.center,
                              icon: Icon(Icons.search_rounded),
                              color: Colors.black,
                              onPressed: () {}),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      drawer: Drawers(),
      body: ListView(
        children: [
          SizedBox(
            height: 5,
          ),
          Card(
            elevation: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                      height: 40,
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Form(key: _formkey,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                      TextFormField(controller: name,

                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,),),
                            border: OutlineInputBorder(),
                            hintText: ("Enter First Name"),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            labelText: "Enter your First Name"),
                        validator: (name){
                          if(name.isEmpty){
                            return "Enter Name";
                          }
                          else {
                            print(name.characters);
                          }
                          return null;
                        },
                      ),
                    ],


                    ),
                  ),


                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    TextFormField(controller:lastname,

                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,),),
                          border: OutlineInputBorder(),
                          hintText: ("Enter Last Name"),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: "Enter your Last Name"),
                      validator: (lastname){
                        if(lastname.isEmpty){
                          return "Enter Name";
                        }
                        else {
                          print(lastname.characters);
                        }
                        return null;
                      },
                    ),
                  ],


                  ),


                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    TextFormField(controller: email,

                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,),),
                          border: OutlineInputBorder(),
                          hintText: ("Email/Mobile*"),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: "Enter your email or mobile number"),
                      validator: (email){
                        if(email.isEmpty){
                          return "Enter your email or mobile number";
                        }
                        else {
                          print(email.characters);
                        }
                        return null;
                      },
                    ),
                  ],


                  ),


                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    TextFormField(controller: mobile,

                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,),),
                          border: OutlineInputBorder(),
                          hintText: ("Mobile"),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: "Enter your mobile number"),
                      validator: (mobile){
                        if(mobile
                            .isEmpty){
                          return "Enter your mobile number";
                        }
                        else {
                          print(mobile.characters);
                        }
                        return null;
                      },
                    ),
                  ],


                  ),


                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    TextFormField(controller: password,

                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,),),
                          border: OutlineInputBorder(),
                          hintText: ("Enter Password"),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: "Enter Password"),
                    validator: (epass){
                      if(epass
                          .isEmpty){
                        return "Enter password";
                      }
                      else {
                        print(password.toString());
                      }
                      return null;
                    },
                    ),
                  ],


                  ),


                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Container(width:screenWidth,color:Colors.deepPurple,child: FlatButton(child: Text("LOGIN",),onPressed: (){

                  },),),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text("   Already have an account"),
                    GestureDetector(child: Container(child: Text(" Login",style: TextStyle(color: Colours.lightBlue),)),onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                    },)
                  ],),

                ),
              ],
            ),
          ),
          Divider(
            thickness: 20,
            color: Colors.grey,
          ),
          SizedBox(
            height: 30,
          ),

          Container(
            height: 383,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 20,
                    child: Text(
                      "    STORE INFORMATION",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Container(
                    width: 380,
                    height: 40,
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.location_on_outlined),
                        ),
                        Container(
                          child: Text("        VoyCode Grocery"),
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Container(
                    width: 380,
                    height: 40,
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.call),
                        ),
                        Container(
                          child: Text("        Call:+91 4884848418"),
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Container(
                    width: 380,
                    height: 40,
                    child: Row(
                      children: [
                        Container(
                          child: Icon(Icons.email),
                        ),
                        Container(
                          child: Text("        Email:info@voycode.com"),
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 20,
                    child: Text(
                      "    USEFUL LINKS",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    child: Container(
                        height: 50, width: 380, child: Text("     ABOUT US")),
                    onTap: () {}),
                GestureDetector(
                    child: Container(
                      height: 50,
                      width: 380,
                      child: Text("     Privacy Policy"),
                    ),
                    onTap: () {}),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 380,
                    child: Text("     Terms & Conditions"),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
