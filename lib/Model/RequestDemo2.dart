
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RequestTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RequestTowState();
  }
}

class RequestTowState extends State<RequestTwo> {

  // // c1: Để viết model
  List<ModelTwo> paserJson(String reponseBody) {
    final modelTow = jsonDecode( reponseBody).cast<Map<String, dynamic>>();
    return modelTow.map<ModelTwo>((json) {
      return ModelTwo.fromJson(json);
    }).toList();
  }
  // c2:
  List<Welcome> welcomeFromJson(String reponseBody) {
    //final welcomeDecode = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return List<Welcome>.from(json.decode(reponseBody).map((json) {
      return Welcome.fromJson(json);
    })).toList();
  }

  String welcomeToJson(List<Welcome> data) {
    return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  }

  Future<List<ModelTwo>> requestApi(http.Client client) async {
    final reponse = await http.get('https://jsonplaceholder.typicode.com/users');
    if(reponse.statusCode == 200) {
      print('200');
      //return welcomeFromJson(reponse.body);
      //return welcomeFromJson(reponse.body);
      return paserJson(reponse.body);
    } else {
      print('Error1122');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: requestApi(http.Client()),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              print('Has Data future buider');
              return ModelTwoDisplay(modelTwoData: snapshot.data);
              //return ScreenContent(modelDataAccount: snapshot.data);

            } else if(snapshot.hasError) {
              print('error111');
            }
            return CircularProgressIndicator(
              backgroundColor: Colors.yellow,
            );
          },
        ),
      ),
    );
  }
}

class ModelTwoDisplay extends StatelessWidget {
  final List<Welcome> modelTwoData;
  ModelTwoDisplay({Key key, this.modelTwoData}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: modelTwoData.length,
          itemBuilder: (context,  index) {
            return Container(
              padding: EdgeInsets.only(left: 20, right:  20),
              alignment: Alignment.topCenter,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.yellow,
                          height: 20,
                          width: 10,
                          margin: EdgeInsets.only(right: 20),
                          child: Text('${modelTwoData[index].id}'),

                        ),
                        Container(
                          color: Colors.blue,
                          height: 20,
                          margin: EdgeInsets.only(right: 10),
                          child: Text('${modelTwoData[index].name}  '+ ' ${modelTwoData[index].username}',
                            style: TextStyle(
                              decoration: TextDecoration.overline,
                            ),
                          ),

                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.yellow,
                          height: 20,
                          margin: EdgeInsets.only(right: 10),
                          child: Text('Email: ${modelTwoData[index].email}'),

                        ),
                        Container(
                          color: Colors.red,
                          height: 20,
                          margin: EdgeInsets.only(right: 10),
                          child: Text('website: ${modelTwoData[index].website} '),

                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Text('${modelTwoData[index].address.geo.lat}'+
                        ' +  ${modelTwoData[index].address.geo.lng }'),
                  )

                ],
              )
            );
          },

        ),
      ),
    );
  }
}

class ModelTwo {
  final String name;
  final String username;
  final int id;
  final String email;
  final String website;
  ModelTwo({this.name, this.username, this.id, this.email, this.website});
  factory ModelTwo.fromJson(Map<String, dynamic> json) {
    return ModelTwo(
      name: json['name'],
      username: json['username'],
      id: json['id'],
      email: json['email'],
        website: json['website']
    );
  }
}

// Viet model dua tren viec pate vao cai trang web
class Welcome {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;
  Welcome({ this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company,});

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      address: Address.fromJson(json["address"]),
      phone: json["phone"],
      website: json["website"],
      company: Company.fromJson(json["company"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address.toJson(),
    "phone": phone,
    "website": website,
    "company": company.toJson(),
  };
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;
  Address({this.street, this.suite, this.city, this.zipcode, this.geo,});
  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: Geo.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo.toJson(),
  };
}

class Geo {
  Geo({this.lat, this.lng,});
  String lat;
  String lng;
  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json["lat"],
    lng: json["lng"],
  );
  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  Company({this.name, this.catchPhrase, this.bs,});
  String name;
  String catchPhrase;
  String bs;
  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );
  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}

