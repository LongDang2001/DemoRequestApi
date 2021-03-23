import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoTrendingScreen extends StatefulWidget {
  final String nameVideoTrending;
  VideoTrendingScreen({ Key key,  @required this.nameVideoTrending}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return VideoTrendingState(nameVideoTrendings: nameVideoTrending);
  }
}
class VideoTrendingState extends State<VideoTrendingScreen> {
  final String nameVideoTrendings;
  VideoTrendingState({this.nameVideoTrendings});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          '${nameVideoTrendings}'
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    child: Image.asset('assets/Group 39.png'),
                    margin: EdgeInsets.only(left: 10, right: 10),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('Stella Malone', style: TextStyle(fontSize: 17, color: Colors.white),),
                          margin: EdgeInsets.only(bottom: 5),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('What kind you like do music', style: TextStyle(fontSize: 14, color: Colors.white),),
                        )

                      ],
                    ),
                  ),
                  Spacer(flex: 4,),
                  Container(
                    height: 17,
                   margin: EdgeInsets.only(right: 15),
                   child: InkWell(
                     child: Image.asset('assets/Group 54.png'),
                     onTap: () {
                       Navigator.pop(context);
                     },
                   ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}