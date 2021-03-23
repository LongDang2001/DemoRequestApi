import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestApiScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RequeatApiState();
  }
}

class RequeatApiState extends State<RequestApiScreen> {
  final List<Model> dataModel;
  RequeatApiState({Key key, this.dataModel});

  // List<Model> parsePhotos(String responseBody) {
  //   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<Model>((json) {
  //     return Model.fromJson(json);
  //   }).toList();
  // }

  List<Model> parser(String reponseBody) {
    final models = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return models.map<Model>((json) {
      return Model.fromJson(json);
    }).toList();
  }

  // Future<List<Model>> requestModel(http.Client client) async {
  //   final reponse = await client.get('https://jsonplaceholder.typicode.com/posts');
  //   if(reponse.statusCode == 200) {
  //     print('True');
  //
  //     // final models = jsonDecode(reponse.body).cast<Map<String, dynamic>>();
  //     // return models.map<Model>((json) {
  //     //   Model.fromJson(json);
  //     // }).toList();
  //     print(reponse.body);
  //     print(reponse.runtimeType);
  //     return parsePhotos(reponse.body);
  //     // return jsonDecode(reponse.body).map<Model>((json) {
  //     //   return Model.fromJson(json).toString();
  //     // });
  //   } else {
  //     print('False');
  //     throw Exception('False 2');
  //   }
  // }



  //
  Future<List<Model>> requestModel(http.Client client) async {
    final reponse = await client.post('https://jsonplaceholder.typicode.com/posts');
    if(reponse.statusCode == 200) {
      print('200');
      return parser(reponse.body);
    } else {
      print('Error');
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          //color: Colors.yellow,
          alignment: Alignment.center,
          child: FutureBuilder<List<Model>>(
            future: requestModel(http.Client()),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                print('Has Data in Future buider');
                return ModelListData(dataMaodel: snapshot.data);

              } else if (snapshot.hasError) {
                print('No Data');
                //return Text("TEXT:   ${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
class ModelListData extends StatelessWidget {
  final List<Model> dataMaodel;
  ModelListData({Key key, this.dataMaodel }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: dataMaodel.length,
            itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index % 2 == 0 ? Colors.cyan : Colors.blue
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    'ID: ${dataMaodel[index].id}'
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '${dataMaodel[index].body}'
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class Model {
  final int userId;
  final int id;
  final String title;
  final String body;
  Model({this.userId, this.id, this.title, this.body});
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }

}