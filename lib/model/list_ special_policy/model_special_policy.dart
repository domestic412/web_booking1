import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/page/signin/controller.dart/info_signin_controller.dart';

class SpecialPolicyList {
  int? id;
  String? code;
  String? shipper;
  String? times;
  String? updateTime;
  String? updateUser;

  SpecialPolicyList(
      {this.id,
      this.code,
      this.shipper,
      this.times,
      this.updateTime,
      this.updateUser});

  SpecialPolicyList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    shipper = json['shipper'];
    times = json['times'];
    updateTime = json['updateTime'];
    updateUser = json['updateUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['shipper'] = this.shipper;
    data['times'] = this.times;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    return data;
  }

  Future<List<SpecialPolicyList>> fetchSpecialPolicyList() async {
    try {
      var url = '$SERVER/SpecialPolicy/GetAll';
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET", //use fot http, not use https
        "Authorization": "Bearer ${informationController.authorize.value}",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data List Quality');
          List dataSpecialPolicyList = json.decode(body);
          return dataSpecialPolicyList
              .map((data) => SpecialPolicyList.fromJson(data))
              .toList();
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error: fetch Policy - $e');
    }
  }
}
