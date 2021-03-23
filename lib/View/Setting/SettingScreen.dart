import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiktok/LoginRegister/Register.dart';
class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingState();
  }
}
class SettingState extends State<SettingScreen> {

  var arrayIconSetting = ['assets/Group 85.png','assets/Group 84.png','assets/Group 86.png',
  'assets/Group 87.png','assets/Group 88.png','assets/Ellipse 22.png'];
  var arrayTextSetting = ['Buy Star', 'Get Star Free', 'Suppor','Privacy Policy', 'Team of User','Changle User'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff191B25),
      appBar: AppBar(
        title: Text(
          'SETTING', style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
        ),
        backgroundColor: Color(0xff323548),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20,left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [

                  Container(
                    margin: EdgeInsets.only(top: 60),
                    height: 140,
                    decoration: BoxDecoration(
                      color: Color(0xff4B4F67),
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          height: 95,
                          child: Image.asset('assets/NoPath - Copy-4.png'),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          child: Text('@jennyNguyen', style: TextStyle(fontSize: 17, color: Colors.white,letterSpacing: 1.5 ),),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('5.320', style: TextStyle(fontSize: 15, color: Colors.white),),
                              ),
                              Container(
                                height: 24,
                                margin: EdgeInsets.only(left: 5),
                                child: Image.asset('assets/icons-255.png'),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              margin: EdgeInsets.only(top: 25),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  crossAxisCount: 2,
                  childAspectRatio: 5/3,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 10, left: 8, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff4B4F67)
                    ),
                    child: index == 5 ? Container(
                      child: Column(
                        children: [
                          TextButton(
                            child: Container(
                              height: 34,
                              width: 34,
                              child: Image.asset('${arrayIconSetting[index]}'),
                            ),
                            onPressed: () async {
                              setState(() {
                                print('mot');
                                showDialog(
                                  //context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Container(
                                          height: 100,
                                          child: CircleAvatar(
                                            maxRadius: 25,
                                            backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser.photoURL),
                                          ),
                                        ),
                                        content: Container(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Text('Name: ${FirebaseAuth.instance.currentUser.displayName}'),
                                                margin: EdgeInsets.only(bottom: 10),
                                              ),
                                              Container(
                                                child: Text('Email: ${FirebaseAuth.instance.currentUser.email}'),
                                              )
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          Container(
                                            child: FlatButton(
                                              child: Text('Sign Out'),
                                              onPressed: () {
                                                GoogleSignIn().disconnect();
                                                GoogleSignIn().signOut();
                                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                  return RegisterScreen();
                                                }));
                                              },
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                );
                              });
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              '${arrayTextSetting[index]}',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ) : Container(
                      child: Column(
                        children: [
                          Container(
                            height: 34,
                            width: 34,
                            child: Image.asset('${arrayIconSetting[index]}'),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              '${arrayTextSetting[index]}',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),

                  );
                },
                itemCount: arrayIconSetting.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}