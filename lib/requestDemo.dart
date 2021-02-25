import 'dart:convert';
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

  List<Model> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Model>((json) => Model.fromJson(json)).toList();
  }

  Future<List<Model>> futureModel;
  Future<List<Model>> requestModel(http.Client client) async {
    final reponse = await client.get('https://jsonplaceholder.typicode.com/posts');
    if(reponse.statusCode == 200) {
      print('True');
      return parsePhotos(reponse.body);
      //return compute(parsePhotos,reponse.body);
      //return Model.fromJson(jsonDecode(reponse.body));
      //return json.decode(reponse.body);
    } else {
      print('False');
      throw Exception('False 2');
    }
  }

  @override
  void initState() {
    //futureModel = requestModel();
    //requestModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          child: FutureBuilder<List<Model>>(
            future: requestModel(http.Client()),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                print('HasData....');
                // pass data class ModellistData
                return ModelListData(dataMaodel: snapshot.data);

              } else if (snapshot.hasError) {
                //return ModelListData(dataMaodel: snapshot.data);
                return Text("TEXT:   ${snapshot.error}");
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
        padding: EdgeInsets.only(left: 10, bottom: 20),
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: dataMaodel.length,
            itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, right: 10),
            child: Text(
              // set id json display
              '${dataMaodel[index].title}'
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