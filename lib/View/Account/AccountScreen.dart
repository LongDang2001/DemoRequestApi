import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/View/Account/AccountAnalytics.dart';
class AccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountState();
  }
}
class AccountState extends State<AccountScreen> {
  List<String> arrayUserAndStar = ['5', '10', '15', '20', '25', '30', '35', '40', '45'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff323548),
        appBar: AppBar(
          backgroundColor: Color(0xff323548),
          title: Container(
            child: Row(
              children: [
                Container(
                  height: 24,
                  child: Image.asset('assets/icons8_crown.png'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Premedium', style: TextStyle(
                    fontSize: 15, color: Colors.white
                  ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            Container(
              height: 24,
              child: Row(
                children: [
                  Text(
                    '5353', style: TextStyle(
                      fontSize: 15, color: Colors.white
                  ),
                  ),
                  Container(
                    height: 24,
                    child: Image.asset('assets/icons-255.png'),
                    margin: EdgeInsets.only(left: 10, right: 16),
                  ),

                ],
              ),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff191B25)
          ),
          padding: EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 95,
                child: Image.asset('assets/NoPath - Copy-4.png'),
              ),
              Container(
                alignment: Alignment.center,
                height: 20,
                margin: EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  '@LongLD', style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    //
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Color(0xff4B4F67)
                      ),
                      alignment: Alignment.center,
                      height: 77,
                      child: Column(
                        children: [
                          Container(
                            width: 119,
                            child: Text('578', style: TextStyle(fontSize: 15, color: Colors.white),),
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                            alignment: Alignment.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 17,
                                  margin: EdgeInsets.only(right: 10),
                                  child: Image.asset('assets/Union 27.png'),
                                ),
                                Text('Following', style: TextStyle(fontSize: 15, color: Color(0xff2EE2B7)),)
                              ],
                            ),
                          )

                        ],
                      ),

                    ),
                    //
                    Container(
                      width: 119,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Color(0xff4B4F67)
                      ),
                      alignment: Alignment.center,
                      height: 77,
                      child: Column(
                        children: [
                          Container(
                            child: Text('578', style: TextStyle(fontSize: 15, color: Colors.white),),
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                            alignment: Alignment.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 17,
                                  margin: EdgeInsets.only(right: 10),
                                  child: Image.asset('assets/icons-90.png'),
                                ),
                                Text('Follower', style: TextStyle(fontSize: 15, color: Color(0xff7D8AF7)),)
                              ],
                            ),
                          )

                        ],
                      ),
                      margin: EdgeInsets.only(left: 10, right: 10),

                    ),
                    //
                    Container(
                      width: 119,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Color(0xff4B4F67)
                      ),
                      alignment: Alignment.center,
                      height: 77,
                      child: Column(
                        children: [
                          Container(
                            child: Text('578', style: TextStyle(fontSize: 15, color: Colors.white),),
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                            alignment: Alignment.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 18),
                                  child: Image.asset('assets/tym 3.png'),

                                ),
                                Text('Like', style: TextStyle(fontSize: 15, color: Color(0xffFF5E79)),)
                              ],
                            ),
                          )

                        ],
                      ),

                    )
                  ],
                ),

              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 77,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffFBA64B),
                      Color(0xffF7337B),
                      Color(0xffB165C2),
                      Color(0xff3183E2),

                    ]
                  )
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset('assets/grapth.png'),
                      height: 39,
                      margin: EdgeInsets.only(right: 20),
                      alignment: Alignment.center,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Analytics', style: TextStyle(
                        fontSize: 20, color: Colors.white
                      ),
                      ),
                    ),
                    Spacer(flex: 4,),
                    Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/push.png'
                              ),
                              fit: BoxFit.cover
                          )
                      ),
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AnalyticsScreen();
                          }));
                        },
                      )
                    ),

                  ],
                ),
              ),
              Container(
                height: 320,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      height: 117,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff4B4F67)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start ,
                              children: [
                                Container(
                                  child: Text(
                                    '+${arrayUserAndStar[index]}', style: TextStyle(fontSize: 25,color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  height: 26,
                                  child: Image.asset('assets/icons-90.png'),

                                )
                              ],
                            ),
                            margin: EdgeInsets.only(bottom: 30),
                          ),
                          Spacer(flex: 4,),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 25,
                                  child: Image.asset('assets/icons-255.png'),
                                ),
                                Container(
                                  child: Text('${arrayUserAndStar[index]}', style: TextStyle(fontSize: 20,color: Color(0xffE9B849)),),
                                  margin: EdgeInsets.only(left: 5),
                                ),
                                Spacer(flex: 4,),
                                Container(
                                  height: 33,
                                  child: TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              child: Text(
                                                'Buy ${arrayUserAndStar[index]} follower', style: TextStyle(fontSize: 25, color: Color(0xffFF0050)),
                                              )
                                            ),
                                            content: Container(
                                              alignment: Alignment.center,
                                              height: 100,
                                              child: Text('you will using ${arrayUserAndStar[index]} star', style: TextStyle(fontSize: 17),),
                                            ),
                                            actions: [
                                              Container(
                                                child: FlatButton(
                                                  child: Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              Spacer(flex: 4,),
                                              Container(
                                                child: FlatButton(
                                                  child: Text('OK'),
                                                  onPressed: () {
                                                    setState(() {

                                                    });
                                                  },
                                                ),
                                              )
                                            ],
                                            //actionsPadding: EdgeInsets.only(left: 20, right: 20),
                                          );
                                        }
                                      );
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/push.png'),
                                      //fit: BoxFit.cover
                                    )
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: arrayUserAndStar.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 4/3,

                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
