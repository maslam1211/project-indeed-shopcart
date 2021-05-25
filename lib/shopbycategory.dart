import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'Stor.dart';

class categories extends StatelessWidget {
  const categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHight = MediaQuery.of(context).size.height;
    return
       Container(width:screenWidth,
         child: ListView.builder(shrinkWrap: true,
             physics: ScrollPhysics(),
             itemCount: Stors.length,
             itemBuilder: (context, index) {
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Card(elevation: 20,
                   child: Container(
                     // elevation: 20,
                     child: Column(
                       children: [
                         Container(
                             height: 200,
                             width: double.infinity,
                             child: Image.asset(
                               Stors[index]["image"],
                               fit: BoxFit.cover,
                             )),
                         Container(
                           alignment: Alignment.centerLeft,
                           height: 50,
                           width: double.infinity,
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(
                               Stors[index]["name"],
                               style: TextStyle(
                                   fontSize: 19, color: Colours.dimGrey),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               );
             }
    ),
       );
  }
}
