import 'package:flutter/material.dart';
class AnalyticsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnalyticsState();
  }
}
class AnalyticsState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff323548),
      appBar: AppBar(
        backgroundColor: Color(0xff323548),
        title: Text(
          'Analytics', style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
          color: Color(0xff191B25)
        ),
      ),
    );
  }
}