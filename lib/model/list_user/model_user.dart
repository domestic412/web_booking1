import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/variable.dart';

class UserList {
  int? id;
  String? maNv;
  String? tenNv;
  String? matKhau;
  String? dienThoai;
  String? email;
  String? code;
  String? author;
  String? updateTime;

  UserList(
      {this.id,
      this.maNv,
      this.tenNv,
      this.matKhau,
      this.dienThoai,
      this.email,
      this.code,
      this.author,
      this.updateTime});

  UserList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maNv = json['maNv'];
    tenNv = json['tenNv'];
    matKhau = json['matKhau'];
    dienThoai = json['dienThoai'];
    email = json['email'];
    code = json['code'];
    author = json['author'];
    updateTime = json['updatetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maNv'] = this.maNv;
    data['tenNv'] = this.tenNv;
    data['matKhau'] = this.matKhau;
    data['dienThoai'] = this.dienThoai;
    data['email'] = this.email;
    data['code'] = this.code;
    data['author'] = this.author;
    data['updatetime'] = this.updateTime;
    return data;
  }

  Future<List<UserList>> fetchUserList() async {
    var url = '$SERVER/User/GetAllProfile';
    final response = await http.get(Uri.parse(url), headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      "Authorization": "Bearer $tokenAuthorize",
    });
    if (response.statusCode == 200) {
      var body = response.body;
      print('Data List User');
      List dataUserList = json.decode(body);
      return dataUserList.map((data) => UserList.fromJson(data)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
