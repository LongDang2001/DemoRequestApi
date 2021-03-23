import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:tiktok/View/OderScreen.dart';
import 'package:tiktok/View/Setting/SettingScreen.dart';
import 'package:tiktok/View/Account/AccountScreen.dart';
import 'package:tiktok/LoginRegister/Register.dart';
import 'package:tiktok/Model/RequestDemo2.dart';
import 'package:tiktok/DataBase/TestFireBase.dart';
import 'package:tiktok/View/Trending/TrendingScreen.dart';
import 'package:tiktok/View/Video/VideoScreen.dart';
import 'package:tiktok/LoginRegister/login.dart';
import 'package:tiktok/Model/requestDemo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
//import 'tabs_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [observer],
      home: Scaffold(
        // body: MyHomePage(
        //   title: 'Firebase title',
        //   analytics: analytics,
        //   observer: observer,
        // )
        body: MainScreen(),
      )
    );
  }
}


class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}
class MainScreenState extends State<MainScreen> {
  int index = 0;
  bool checkImgae = true;
  List<Widget> widgetOption = [
    Container(
      child: AccountScreen(),
    ),
    Container(
      child: VideoScreen(),
    ),
    Scaffold(
      body: TrendingScreen(),
    ),
    Scaffold(
      body: OderScreen(),
    ),
    Container(
      child: SettingScreen(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: widgetOption.elementAt(index),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //showSelectedLabels: true,
          //showUnselectedLabels: true,
          currentIndex: index,
          backgroundColor: Colors.black,
          unselectedItemColor: Color(0xff707070),
          selectedItemColor: Color(0xff00F2EA),
          onTap: (int selecIndex) {
            setState(() {
              index = selecIndex;

            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  height: 24,
                  child: index - 0 == 0  ?  Image.asset('assets/icons-58.png') : Image.asset('assets/icons-150.png'),
                ),
                label: 'Account'
            ),
            BottomNavigationBarItem(
                icon: Container(
                  height: 24,
                  child: index - 1 == 0 ? Image.asset('assets/icons-245.png'): Image.asset('assets/icons-117.png'),
                ),
                label: 'Video'
            ),
            BottomNavigationBarItem(
                icon: Container(
                  height: 24,
                  child: index - 2 == 0 ? Image.asset('assets/icons-138.png'): Image.asset('assets/icons-149.png'),
                ),
                label: 'Trending'
            ),
            BottomNavigationBarItem(
                icon: Container(
                  height: 24,
                  child: index - 3 == 0 ? Image.asset('assets/icons-162.png'): Image.asset('assets/icons-167.png'),
                ),
                label: 'Oder'
            ),
            BottomNavigationBarItem(
                icon: Container(
                  height: 24,
                  child: index - 4 == 0 ? Image.asset('assets/icons-168.png'): Image.asset('assets/icons-163.png'),
                ),
                label: 'Setting'
            ),
          ],
        ),
      ),
    );
  }
}



