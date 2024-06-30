import 'dart:convert';

import 'package:e_commerce_app/Core/Error/Exception/Exception.dart';
import 'package:e_commerce_app/Features/Profile/Data/Data_source/Remote_data_source/Profile_user_remote_data_source.dart';
import 'package:e_commerce_app/Features/Profile/Data/Model/Profile_user_Model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileUserRemoteDataSourceImpl implements ProfileUserRemoteDataSource {
  @override
  Future<ProfileUserModel> getSingleUserData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("x-auth-token");

    final Response response = await http.get(
        Uri.parse(
          "http://192.168.85.146:3000/user",
        ),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": token!,
        });

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print("$result");
      return ProfileUserModel.fromMap(result);
    } else if (response.statusCode == 400) {
      print("${jsonDecode(response.body)['msg']}");
      throw ServerException400(
        message: "${jsonDecode(response.body)['msg']}",
        statusCode: 400,
      );
    } else if (response.statusCode == 500) {
      print("${jsonDecode(response.body)['error']}");
      throw ServerException500(
        message: "${jsonDecode(response.body)['error']}",
        statusCode: 500,
      );
    } else if (response.statusCode == 401) {
      print("${jsonDecode(response.body)['msg']}");
      throw ServerException401(
        message: "${jsonDecode(response.body)['msg']}",
        statusCode: 401,
      );
    } else {
      throw const UnHandleException(message: "UnHandle Exception", statusCode: 000);
    }
  }
}
