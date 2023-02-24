//Type : { [ {}, {}, {} ] }
//Wind API

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apipractice/models/wind_model.dart';
import 'dart:convert';

//Uncomment to use compute function, i.e parsing JSON in background
/*
import 'package:flutter/foundation.dart';
Future<WindModel> getWindApi() async {
  final response = await http.get(Uri.parse(
      "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0"));
  // var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return compute(computeWindApi, response.body);
  } else {
    throw Exception("Something went wrong, can't fetch API at the moment.");
  }   
}

WindModel computeWindApi(String responseBody) {
  // return WindModel.fromJson(responseBody).cas;
  var data = jsonDecode(responseBody);
  return WindModel.fromJson(data);
}
*/



Future<WindModel> getWindApi() async {
  final response = await http.get(Uri.parse(
      "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0"));
  var data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return WindModel.fromJson(data);
  } else {
    throw Exception("Something went wrong, can't fetch API at the moment.");
  }
}

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<WindModel> _futureWind;

  @override
  void initState() {
    super.initState();
    _futureWind = getWindApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WindModel>(
        future: _futureWind,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Product Name : ${snapshot.data!.product}"),
                    const SizedBox(
                      height: 5,
                    ),
                    for (int i = 0; i < snapshot.data!.dataseries!.length; i++)
                      Column(
                        children: [
                          Text(
                              "DataSeries  #$i  direction : ${snapshot.data!.dataseries![i].wind10m!.direction}"),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                              "DataSeries #$i speed: ${snapshot.data!.dataseries![i].wind10m!.speed}"),
                        ],
                      ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text("Following Error occured : ${snapshot.error}"));
          } else {
            return const Center(
                child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 12, 90, 82)));
          }
        },
      ),
    );
  }
}


//Type : [ {}, {}, {} ] 
//Products API (Handle Null Values!)
//https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline
/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apipractice/models/ecommerce_model.dart';
import 'dart:convert';

Future<List<EcommerceModel>> getEcommerceApi() async {
  List<EcommerceModel> ecommerceList = [];
  final response = await http.get(
      Uri.parse("https://webhook.site/401d8ed4-6091-48a9-848f-1d85b87e9bd7"));
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (Map<String, dynamic> item in data) {
      ecommerceList.add(EcommerceModel.fromJson(item));
      return ecommerceList;
    }
  }
  return ecommerceList;

  // return throw Exception("Something went wrong, couldn't fetch data.");
}

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<EcommerceModel>> displayList;

  @override
  void initState() {
    super.initState();
    displayList = getEcommerceApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: displayList,
          builder: (context, AsyncSnapshot<List<EcommerceModel>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${snapshot.data!.length}"),
                          Image.network("${snapshot.data![index].imageLink}"),
                          Text("${snapshot.data![index].name}",
                              style: const TextStyle(fontSize: 20)),
                          Text("Price : \$${snapshot.data![index].price}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                              minimumSize: const Size(50, 20),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 69, 131),
                            ),
                            child: const Text(
                              "Explore Prodcut",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Colors.amberAccent),
              );
            }
          }),
    );
  }
}

*/

