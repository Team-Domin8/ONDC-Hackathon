import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {

  Map mapResponse = {};

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
  Widget build(BuildContext context) {
    return Container();
  }
}
