import 'package:flutter/material.dart';
import 'Stor.dart';
class trending extends StatelessWidget {
  const trending({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHight = MediaQuery.of(context).size.height;
    return Container(width: screenWidth,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount:Stors1.length,itemBuilder: (context,index){
      return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 20,
          child: Center(
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 116,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(Stors1[index]["image"]),
                      ),
                    ),
                    Container(alignment: Alignment.center,
                      width: 220,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 230,
                            height: 40,
                            child: Text(
                              Stors1[index]["name"],
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
                              Stors1[index]["gram"],
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
                                  Stors1[index]["rs"],
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
                                  Stors1[index]["rsno"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 230,
                            height: 80,
                            child: FlatButton(
                              child: Text("ADD TO CART"),
                              color: Colors.deepPurple,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    ),);

  }
}
