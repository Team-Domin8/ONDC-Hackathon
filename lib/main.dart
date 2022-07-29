import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ondc/screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: AppHomePage(),
    );
  }
}

String stringResponse = "";
Map mapResponse = Map();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.test.esamudaay.com/api/v1/businesses/0635ecff-8fde-4185-8cd8-167efda42bbc?format=json"));
    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        mapResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Integration"),
      ),
      body: Center(
        child: Container(
          height: 800,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
          ),
          child: Center(
              child: mapResponse == null
                  ? Text("Data is Loading")
                  : Text(mapResponse["address"].toString())),
        ),
      ),
    );
  }
}