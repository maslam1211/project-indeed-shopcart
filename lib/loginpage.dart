import 'package:flutter/material.dart';
import 'package:projectshoopingcart/homepage.dart';
import 'package:projectshoopingcart/singn%20up.dart';
import 'drawer.dart';
import 'package:colours/colours.dart';

class login extends StatefulWidget {


  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool value=false;
  GlobalKey<FormState>formkey=GlobalKey();
 TextEditingController email=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colours.lightSlateGrey,

      body: ListView(
        children: [
          SizedBox(
            height: 5,
          ),
          Card(elevation: 20,
            child: Form(key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Center(
                    child: Container(
                        height: 70,
                        child: Text(
                          "Login",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    TextFormField(

                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Colors.deepPurple,),),
                            border: OutlineInputBorder(),
                            hintText: ("Email/Mobile*"),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            labelText: "Enter your email or mobile number"),
                      // validator: (String value) {
                      //   if (!value.contains("@")) {
                      //     return "Please enter a valid email";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      validator: (value){
                          if(value .isEmpty){
                            return "Enter your email or mobile number";
                          }else if (!value.contains("@")){
                            return "Enter your correct email";
                          }else return null;
                      },
                      ),
                    ],


                    ),


                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,),),
                          border: OutlineInputBorder( borderSide: BorderSide(color: Colors.red)),
                          hintText: ("Password"),labelText: "Password"),
validator: (value){
                        if (value.isEmpty){
                          return "* password";
                        }else if (value.length<6){
                          return "password must be at 6 no";
                        }else  return  null;

},
                      // validator: ( value) {
                      //   if (value.length<6) {
                      //     return "Password must be at 6 characters";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    ),
                  ),
                  SizedBox(height: 10,),

                     Row(
                       children:[
                         Container(
                           child: Checkbox(value: value, onChanged: (value){
                             setState(() {
                               this.value=value;
                             });
                           }),
                         ),
                         Text("Remember password")

                       ]
                     ),



                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Container(width:screenWidth,color:Colors.deepPurple,child: FlatButton(child: Text("LOGIN",),onPressed: (){
                     if(formkey.currentState.validate()){
                       print("required");
                       setState(() {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
                       });
                     }
                    },),),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("   Dont't have an account"),
                      GestureDetector(child: Text("Sign up",style: TextStyle(color: Colours.lightBlue),),onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                      },)
                    ],),

                  ),
                  Column(
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(alignment: Alignment.centerRight,
                          child: Text("Forget password?",style: TextStyle(color: Colours.lightBlue),)),
                    ),
                      SizedBox(height: 20),
                  ],)
                ],
              ),
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
