import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class OderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OderState();
  }
}
class OderState extends State<OderScreen> {
  var tap = 0;
  List<String> arrayVideoImage = ['assets/NoPath - Copy (23).png','assets/selfie-wall-posing-with-props.png','assets/NoPath - Copy (26).png',
    'assets/NoPath - Copy (25).png','assets/NoPath - Copy (24).png','assets/Group 79.png','assets/NoPath - Copy (22).png',
    'assets/NoPath - Copy (21).png','assets/NoPath - Copy (19).png','assets/NoPath - Copy (18).png','assets/NoPath - Copy (17).png',
    'assets/NoPath - Copy (15).png'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Color(0xff323548),
        appBar: AppBar(
          backgroundColor: Color(0xff323548),
          title: Text(
            ' MY ORDER', style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          bottom: TabBar(
            tabs: [
              Container(
                width: 114,
                height: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: tap == 0 ? Color.fromRGBO(255, 0, 80, 0.11) : Colors.transparent,
                        spreadRadius: 6,

                      )
                    ]
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'PENDING', style: TextStyle(
                      fontSize: 13,
                      color: tap == 0 ? Color(0xffFF0050) : Color(0xff666874)),
                  ),
                )
              ),
              Container(
                width: 114,
                height: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: tap == 0 ? Colors.transparent : Color.fromRGBO(0, 242, 234, 0.1),
                        spreadRadius: 6,

                      )
                    ]
                ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'SUCCESS', style: TextStyle(
                        fontSize: 13,
                        color: tap == 0 ? Color(0xff666874) : Color(0xff00F2EA)
                    ),
                    ),
                  )
              )
            ],
            indicatorColor: Colors.transparent,
            onTap: (taps) {
              setState(() {
                tap = taps;
              });
            },
          ),
        ),

        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: TabBarView(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                    color: Color(0xff191B25)
                ),
                  padding: EdgeInsets.only(top: 20, left: 12, right: 12),
                child: ListView.builder(
                  itemCount: arrayVideoImage.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff323548)
                      ),
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.all(6),
                      child: Container(
                        height: 77,
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: CircleAvatar(
                                backgroundImage: AssetImage('${arrayVideoImage[index]}'),
                                radius: 30,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Spacer(flex: 4,),
                            Container(
                              height:60,
                              width: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          child: Text('3/10', style: TextStyle(fontSize: 16, color: Colors.white),),
                                          margin: EdgeInsets.only(right: 5),
                                        ),
                                        Container(
                                          height: 24,
                                          child: Image.asset('assets/tym 3.png'),
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.only(bottom: 8),
                                  ),
                                  Container(
                                    child: Text(
                                      '08/09/2001  14:05', style: TextStyle(fontSize: 12, color: Color(0xff696C85)),
                                    ),
                                  )

                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    );
                  },
                )
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                      color: Color(0xff191B25)
                  ),
                  padding: EdgeInsets.only(top: 20, left: 12, right: 12),
                  child: ListView.builder(
                    itemCount: arrayVideoImage.length,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xff323548)
                          ),
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.all(6),
                          child: Container(
                            height: 77,
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('${arrayVideoImage[index]}'),
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Spacer(flex: 4,),
                                Container(
                                  height:60,
                                  width: 120,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              child: Text('5/10', style: TextStyle(fontSize: 16, color: Colors.white),),
                                              margin: EdgeInsets.only(right: 5),
                                            ),
                                            Container(
                                              height: 24,
                                              child: Image.asset('assets/tym 3.png'),
                                            )
                                          ],
                                        ),
                                        margin: EdgeInsets.only(bottom: 8),
                                      ),
                                      Container(
                                        child: Text(
                                          '17/05/2001  12:05', style: TextStyle(fontSize: 12, color: Color(0xff696C85)),
                                        ),
                                      )

                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      );
                    },
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}