import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'shopbycategory.dart';
import 'drawer.dart';
class cateshop extends StatefulWidget {
  const cateshop({Key key}) : super(key: key);

  @override
  _cateshopState createState() => _cateshopState();
}

class _cateshopState extends State<cateshop>with SingleTickerProviderStateMixin {
  bool _isScrollToTopBtnVisible =false;
  AnimationController _animationController;
  ScrollController _scrollController =ScrollController();
  @override
  void initState(){
    super.initState();
    _scrollController.addListener(_scollListner);
    _animationController=AnimationController(vsync: this, duration: Duration(seconds :1),reverseDuration:Duration(seconds:1) );
  }

  @override
  void dispose(){
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();

  }
  _scollListner(){
    if (_scrollController.position.pixels>=600){
      _animationController.forward();
      setState(() => _isScrollToTopBtnVisible=true);

    } else if(_scrollController.position.pixels<600){
      _animationController.reverse();
      setState(() => _isScrollToTopBtnVisible=false);
    }
  }
  @override
  int itemCount = 0;
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
        height: 38,
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
    floatingActionButton:Stack(children: [
    if(_isScrollToTopBtnVisible)...[
    ScaleTransition(scale: CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn)),
    FloatingActionButton(
    mini: true,
    tooltip: "scroll to top",child:Icon(Icons.keyboard_arrow_up),onPressed: (){
    _animationController.reverse();
    _scrollController.animateTo(0, duration: Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
    },
    )
    ]

    ],),
    body: Container(height: screenHeight,width: screenWidth,
    child: ListView(physics: ScrollPhysics(),
    controller: _scrollController,
    children: [
    SizedBox(
    height: 5,
    ),
    Center(
    child: Container(
    alignment: Alignment.center,
    height: 50,
    width: 350,
    child: Text(
    "SHOP BY CATEGORY",
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30),
    ),
    )),
    SizedBox(
    height: 5,
    ),
    Center(
    child: Container(
    alignment: Alignment.center,
    height: 20,
    width: 90,
    child: Row(
    children: [
    Container(height: 8, width: 10, color: Colors.blue),
    Container(
    height: 8,
    width: 10,
    color: Colours.lightSlateGrey,
    ),
    Container(
    height: 8,
    width: 50,
    color: Colors.red,
    ),
    Container(
    height: 8,
    width: 10,
    color: Colours.lightSlateGrey,
    ),
    Container(height: 8, width: 10, color: Colors.blue),
    ],
    ),
    )),

    categories(),

    SizedBox(
    height: 70,
    ),
    Divider(
    thickness: 50,
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
    ),
    );
  }
}
