import 'package:flutter/cupertino.dart';
import 'package:projectshoopingcart/drawer.dart';
import 'package:projectshoopingcart/productsshop.dart';
import 'package:projectshoopingcart/shopbycategory.dart';
import 'package:projectshoopingcart/trendingproducts.dart';
import 'shopbycategory.dart';
import 'loginpage.dart';


import 'package:flutter/material.dart';

import 'package:colours/colours.dart';
import 'package:carousel_pro/carousel_pro.dart';

class homepage extends StatefulWidget {

  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>with SingleTickerProviderStateMixin
{
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
            // Container(
            //   height: 250,width: double.infinity,
            //   child:CarouselSlider(
            //     items: [
            //       Container(
            //
            //         decoration: BoxDecoration(
            //
            //         ),child: Stack(
            //         children: [
            //           Image.asset("images/f.jpg",width:double.infinity,fit: BoxFit.cover),
            //           Container(alignment:Alignment.center,child: Text("Fresh Fruits - Fresh stock arrives each day at 6pm ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
            //
            //
            //
            //         ],),),
            //
            //       // Container(
            //       //
            //       //   decoration: BoxDecoration(
            //       //
            //       //   ),child: Image.asset("images/f.jpg",width:double.infinity,fit: BoxFit.cover,),
            //       // ),
            //     ],
            //     options: CarouselOptions(
            //
            //       pageSnapping: true,
            //       enlargeCenterPage: true,
            //       autoPlay: false,
            //       // aspectRatio: 16 / 9,
            //       autoPlayCurve: Curves.fastOutSlowIn,
            //       enableInfiniteScroll: true,
            //       autoPlayAnimationDuration: Duration(milliseconds: 800),
            //       // viewportFraction: 0.8,
            //
            //     ),
            //   ),
            //
            //
            //
            //
            // ),
            Container(
              height: 290,
              width: double.infinity,
              child: Carousel(
                dotBgColor: Colors.transparent,
                dotIncreasedColor: Colors.black,
                autoplayDuration: const Duration(seconds: 8),
                dotSize: 2,
                images: [
                  Container(
                    child: Stack(children: [
                      Image.asset(
                        'images/f.jpg',
                        fit: BoxFit.cover,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                            "Fresh Fruits - Fresh stock arrives each day at 6pm ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          Container(
                              child: RaisedButton(
                            color: Colours.deepPurple,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>product()));
                            },
                            child: Text("SHOP NOW"),
                          ))
                        ],
                      )
                    ]),
                  ),
                  Container(
                    child: Stack(
                      children: [
                        Image.asset(
                          'images/f.jpg',
                          fit: BoxFit.cover,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Fresh Vegetables - Sourced straight from farms,",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "everyday",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
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
            Center(
                child: Container(
              child: Text(
                "TRENDING PRODUCT",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            )),
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
            Container(child: trending(

            ),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey,
                  child: FittedBox(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 164,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset("images/green.jpg"),
                          ),
                        ),
                        Container(
                          width: 220,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 230,
                                height: 40,
                                child: Text(
                                  "Green Tea",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                width: 230,
                                height: 40,
                                child: Text(
                                  "100G",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38,
                                      fontSize: 16),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 40,
                                    child: Text(
                                      "\$25.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 40,
                                    child: Text(
                                      "\$30.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                          decoration: TextDecoration.lineThrough),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      child: SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              child: IconButton(
                                                icon: new Icon(Icons.remove),
                                                onPressed: () => setState(
                                                  () => itemCount != 0
                                                      ? itemCount--
                                                      : itemCount,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Card(
                                              elevation: 10,
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                  ),
                                                  color: Colors.transparent,
                                                ),
                                                width: 30,
                                                height: 30,
                                                child: Text(
                                                  itemCount.toString(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            CircleAvatar(
                                              child: IconButton(
                                                icon: new Icon(Icons.add),
                                                onPressed: () =>
                                                    setState(() => itemCount++),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey,
                  child: FittedBox(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 164,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset("images/bread.jpg"),
                          ),
                        ),
                        Container(
                          width: 220,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 230,
                                height: 40,
                                child: Text(
                                  "Hi-fiber Bread",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                width: 230,
                                height: 40,
                                child: Text(
                                  "600G",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38,
                                      fontSize: 16),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 40,
                                    child: Text(
                                      "\$25.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 40,
                                    child: Text(
                                      "\$30.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                          decoration: TextDecoration.lineThrough),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      child: SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              child: IconButton(
                                                icon: new Icon(Icons.remove),
                                                onPressed: () => setState(
                                                      () => itemCount != 0
                                                      ? itemCount--
                                                      : itemCount,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Card(
                                              elevation: 10,
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                  ),
                                                  color: Colors.transparent,
                                                ),
                                                width: 30,
                                                height: 30,
                                                child: Text(
                                                  itemCount.toString(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            CircleAvatar(
                                              child: IconButton(
                                                icon: new Icon(Icons.add),
                                                onPressed: () =>
                                                    setState(() => itemCount++),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

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
            Center(
                child: Container(
              child: Text(
                "TRENDING PRODUCT",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            )),
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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            "images/apple.jpg",
                            fit: BoxFit.cover,
                          )),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Minimum 20% OFF",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Vegetables & Fruits",
                            style:
                                TextStyle(fontSize: 15, color: Colours.dimGrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            "images/House.jpg",
                            fit: BoxFit.cover,
                          )),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "UPTO 50% OFF",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Household Items",
                            style:
                                TextStyle(fontSize: 15, color: Colours.dimGrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            "images/apple.jpg",
                            fit: BoxFit.cover,
                          )),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "UNDER 60% OFF",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Vegetables & Fruits",
                            style:
                                TextStyle(fontSize: 15, color: Colours.dimGrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            "images/Gr.jpg",
                            fit: BoxFit.cover,
                          )),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "UPTO 50 % OFF",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Gocery Items",
                            style:
                                TextStyle(fontSize: 15, color: Colours.dimGrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Divider(
              thickness: 30,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
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













