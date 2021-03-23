import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/View/Trending/VideoTrending.dart';
class TrendingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TrendingState();
  }
}
class TrendingState extends State<TrendingScreen> {
  List<String> arrayVieoTrending = ['assets/NoPath - Copy (23).png','assets/selfie-wall-posing-with-props.png','assets/NoPath - Copy (26).png',
    'assets/NoPath - Copy (25).png','assets/NoPath - Copy (24).png','assets/Group 79.png','assets/NoPath - Copy (22).png',
    'assets/NoPath - Copy (21).png','assets/NoPath - Copy (19).png','assets/NoPath - Copy (18).png','assets/NoPath - Copy (17).png',
    'assets/NoPath - Copy (15).png'];
  List<String> arrayNumberWatch = ['555','123','343','5455','243','776','9766','3545','4546','4882','123','123'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff191B25),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 25,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 80, bottom: 20),
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      child: Image.asset('assets/icons8_ratings.png'),
                    ),
                    Container(
                      height: 25,
                      child: Text(
                        ' TOP 10 ', style: TextStyle(fontSize: 25, color: Color(0xffFF0050)),
                      ),
                    ),
                    Container(
                      height: 25,
                      child: Text(
                        'TRENDING', style: TextStyle(fontSize: 25, color: Color(0xff00F2EA)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 674,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.yellow,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              '${arrayVieoTrending[index]}'
                                          ),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return VideoTrendingScreen(nameVideoTrending: arrayVieoTrending[index],);
                                    }));
                                  });
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                height: 24,
                                width: double.infinity,
                                //color: Colors.yellow,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height: 21,
                                      width: 21,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/Group 85.png'
                                          ),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'ABC ksdsd DDA', style: TextStyle(fontSize: 15, color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),

                              )
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 5, right: 5),
                              height: 24,
                              width: 68,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(255, 255, 255, 0.5),

                                    )
                                  ]
                              ),
                              child: Container(
                                padding: EdgeInsets.only(left: 8, top: 5, bottom: 5, right: 5),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 11,
                                      child: Image.asset('assets/LikeTym.png'),
                                      margin: EdgeInsets.only(right: 5),
                                    ),
                                    Container(
                                      child: Text(
                                        // Node
                                        '${arrayNumberWatch[index]}',
                                        style: TextStyle(fontSize: 11, color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          Container(

                          )
                        ],
                      ),
                    );
                  },
                  itemCount: arrayVieoTrending.length,
                ),

              )
            ],
          ),
        )
      ),
    );
  }
}