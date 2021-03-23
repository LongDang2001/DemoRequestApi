import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/DataBase/DataBase.dart';
import 'package:tiktok/View/Video/VideoSelector.dart';
class VideoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VideoState();
  }
}
class VideoState extends State<VideoScreen> {
  List<String> arrayVideoImage = ['assets/NoPath - Copy (23).png','assets/selfie-wall-posing-with-props.png','assets/NoPath - Copy (26).png',
    'assets/NoPath - Copy (25).png','assets/NoPath - Copy (24).png','assets/Group 79.png','assets/NoPath - Copy (22).png',
    'assets/NoPath - Copy (21).png','assets/NoPath - Copy (19).png','assets/NoPath - Copy (18).png','assets/NoPath - Copy (17).png',
  'assets/NoPath - Copy (15).png'];
  List<String> arrayNumberTym = ['555','123','343','5455','243','776','9766','3545','4546','4882','123','123'];
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
            color: Color(0xff191B25),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),

          ),
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Chosse a video', style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16,bottom: 16),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xff4B4F67)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Video link', labelStyle: TextStyle(fontSize: 15, color: Color(0xff707070)),

                  ),
                  keyboardType: TextInputType.text,
                  //keyboardAppearance: Brightness.light,
                  // inputFormatters: [
                  //   //FilteringTextInputFormatter.runtimeType
                  // ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).copyWith().size.height-256,
                child: GridView.builder(
                  itemCount: arrayVideoImage.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 4,
                      crossAxisCount: 3,
                      childAspectRatio: 3/4,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: AssetImage('${arrayVideoImage[index]}')
                                    )
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return VideoSelectorScreen(imageVideo: arrayVideoImage[index]);
                                  }));
                                });
                              },

                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, right: 5),
                              height: 24,
                              width: 68,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color.fromRGBO(0, 0, 0, 0.1),
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
                                       '${arrayNumberTym[index]}',
                                       style: TextStyle(fontSize: 11, color: Colors.white),
                                     ),
                                    )
                                  ],
                                ),
                              )
                            )

                          ],
                        ),

                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}