import 'package:flutter/material.dart';
class ScreenContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateContent();
  }
}
class StateContent extends State<ScreenContent> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0*323548),
          title: Row(
            children: [
              Image.asset('name'),
              Spacer(),
              Text('Premedium')
            ],
          ),
          actions: [
            Row(
              children: [
                Text('5.349'),
                Spacer(),
                IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {

                    }
                )
              ],
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 18, left: 16, right: 16),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 95,
                width: 95,
                child: Image.asset('name'),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '@JenyNguyen'
                ),
              ),
              Container(
                height: 77,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:Color(0x4B4F67),

                      ),
                    ),
                    Spacer(),
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:Color(0x4B4F67),

                      ),
                    ),
                    Spacer(),
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:Color(0x4B4F67),

                      ),
                    )
                  ],
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}