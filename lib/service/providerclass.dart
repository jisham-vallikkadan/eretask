import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/sproduct_model.dart';
import '../screens/productpage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestProvider with ChangeNotifier {

  int? productpice;
  int? offierproze;

  Future login(Map<String, dynamic> logindata, BuildContext) async {
    var url = 'https://whatsappshop.in/api/customer/login';
    var responce = await http.post(Uri.parse(url), body: logindata);
    var body = jsonDecode(responce.body);
    if (responce.statusCode == 200) {
      print(body['sts']);
      if (body['sts'] == '01') {
        Navigator.push(
            BuildContext,
            MaterialPageRoute(
              builder: (context) => ProductListpage(),
            ));
      } else {
        Fluttertoast.showToast(msg: "Enetr currect password and Email");
      }
    }
  }

  Future<List<Sproducts>> getsproducts() async {
    log('j,gjhgjgjhgjhgjhjhg');
    var url = 'https://whatsappshop.in/api/product/1442';
    var responce = await http.post(
      Uri.parse(url),
    );
    if (responce.statusCode == 200) {
      var body = json.decode(responce.body);

      List<Sproducts> listData = List<Sproducts>.from(
          body['sproducts'].map((v) => Sproducts.fromJson(v))).toList();
      print(listData);
      return listData;
    } else {
      List<Sproducts> listData = [];
      return listData;
    }
  }
}
