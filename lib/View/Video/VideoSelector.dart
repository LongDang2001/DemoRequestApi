import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class VideoSelectorScreen extends StatefulWidget {
  final String imageVideo;
  VideoSelectorScreen({Key key, this.imageVideo}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return VideoSelectorState(imageVideos: imageVideo);
  }
}
class VideoSelectorState extends State<VideoSelectorScreen> {
  final String imageVideos;
  VideoSelectorState({Key key, this.imageVideos});
  var numberStar = '5.553';
  var  arrayNumberTym = ['5', '10', '15', '20', '25', '30', '35', '40', '45','50','55'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191B25),
      appBar: AppBar(
        backgroundColor: Color(0xff323548),
        actions: [
          Container(
            height: 24,
            child: Row(
              children: [
                Text(
                  '${numberStar}', style: TextStyle(
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
        padding: EdgeInsets.only(top: 20, left: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
          color: Color(0xff191B25)
        ),
        child: Column(
          children: [
            Container(
              height: 300,
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 3/5,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('${imageVideos}'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 77,
              margin: EdgeInsets.only(top: 15, bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xff4B4F67),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text('1263', style: TextStyle(fontSize: 15, color: Colors.white),),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 8),
                                height: 24,
                                child: Image.asset('assets/tym 3.png'),
                              ),
                              Container(
                                child: Text(
                                  'Like', style: TextStyle(fontSize: 12, color: Color(0xffFF5E79) ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xff4B4F67),
                      borderRadius: BorderRadius.circular(8),

                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text('263', style: TextStyle(fontSize: 15, color: Colors.white),),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 8),
                                height: 24,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/icons8_chat_bubble.png'),
                                    fit: BoxFit.cover
                                  )
                                ),
                                child: Image.asset('assets/icons8_chat_bubble.png'),
                              ),
                              Container(
                                child: Text(
                                  'Comment', style: TextStyle(fontSize: 12, color: Color(0xff7D8AF7) ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(left: 8, right: 8),
                  ),
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xff4B4F67),
                      borderRadius: BorderRadius.circular(8),

                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text('63', style: TextStyle(fontSize: 15, color: Colors.white),),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 8),
                                height: 24,
                                child: Image.asset('assets/icons8_forward_arrow.png'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Share', style: TextStyle(fontSize: 12, color: Color(0xff2EE2B7) ),
                                ),
                              )
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
              height: 235,
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
                                  '+55', style: TextStyle(fontSize: 25,color: Colors.white),
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
                                height: 20,
                                child: Text('55', style: TextStyle(fontSize: 20,color: Color(0xffE9B849)),),
                                margin: EdgeInsets.only(left: 8),
                              ),
                              Spacer(flex: 4,),
                              Container(
                                height: 33,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/push.png'),
                                      //fit: BoxFit.cover
                                    )
                                ),
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
                                                  'Buy ${arrayNumberTym[index]} follower', style: TextStyle(fontSize: 25, color: Color(0xffFF0050)),
                                                )
                                            ),
                                            content: Container(
                                              alignment: Alignment.center,
                                              height: 100,
                                              child: Text('you will using ${arrayNumberTym[index]} star', style: TextStyle(fontSize: 17),),
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
                                //color: Colors.yellow,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: arrayNumberTym.length,
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
      // bottomSheet: Container(
      //   height: 20,
      //   color: Colors.red,
      // ),

    );
  }
}