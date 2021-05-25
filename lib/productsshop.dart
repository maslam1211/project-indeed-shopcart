import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'package:projectshoopingcart/trendingproducts.dart';
import 'shopbycategory.dart';
import 'drawer.dart';
class product extends StatefulWidget {
  const product({Key key}) : super(key: key);

  @override
  _productState createState() => _productState();
}

class _productState extends State<product>with SingleTickerProviderStateMixin {
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
            Center(
                child: FittedBox(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,

                          child: Text(
                            "    Kitchen And Dining Needs",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,

                          child: Text(
                            "Personal Care        ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ]
                  ),
                )),
            Container(width:50,child: Center(child: Divider(thickness: 1,height: 1,))),
            SizedBox(
              height: 5,
            ),


            trending(),
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
