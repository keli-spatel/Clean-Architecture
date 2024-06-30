import 'dart:convert';
import 'package:e_commerce_app/Core/Error/Exception/Exception.dart';
import 'package:e_commerce_app/Features/Authentication/Data/Model/User_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Domain/Entity/User_Entity.dart';
import 'User_remote_data_source.dart';
import 'package:http/http.dart' as http;

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  // bool _checkedLoggedIn = false;
  @override
  Future<void> signInUser(UserEntity userEntity) async {
    //
    http.Response httpResponse = await http.post(
        Uri.parse(
          "http://192.168.85.146:3000/api/signin",
        ),
        body: jsonEncode({
          "email": userEntity.email,
          "password": userEntity.password,
        }),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        });

    if (httpResponse.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString(
      "x-auth-token", jsonDecode(httpResponse.body)['token']);
      print("SuccessFully Passed SignIn >>>");
      print(httpResponse.body);
      // throw ServerException400(message: "'${jsonDecode(httpResponse.body)['msg']}'}", statusCode: 400);
    } else if (httpResponse.statusCode == 400) {
      print("${jsonDecode(httpResponse.body)['msg']}");
      throw ServerException400(
        message: '${jsonDecode(httpResponse.body)['msg']}',
        statusCode: 400,
      );
    } else if (httpResponse.statusCode == 500) {
      print("${jsonDecode(httpResponse.body)['error']}");
      throw ServerException500(
        message: '${jsonDecode(httpResponse.body)['error']}',
        statusCode: 500,
      );
    }
  }

  @override
  Future<void> signUpUser(UserEntity userEntity) async {
    //
    http.Response httpResponse = await http.post(
        Uri.parse(
          "http://192.168.85.146:3000/api/signup",
        ),
        body: jsonEncode({
          'name': userEntity.name,
          'email': userEntity.email,
          'password': userEntity.password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (httpResponse.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString(
          "x-auth-token", jsonDecode(httpResponse.body)['token']);
      print("SuccessFully Passed SignUp >>>");
      // throw ServerException400(message: "'${jsonDecode(httpResponse.body)['msg']}'}", statusCode: 400);
      print(httpResponse.body);
    } else if (httpResponse.statusCode == 400) {
      print("Validation Error : ${jsonDecode(httpResponse.body)['msg']}");
      throw ServerException400(
        message: '${jsonDecode(httpResponse.body)['msg']}',
        statusCode: 400,
      );
    } else if (httpResponse.statusCode == 500) {
      print("Error : ${jsonDecode(httpResponse.body)['error']}");
      throw ServerException500(
        message: '${jsonDecode(httpResponse.body)['error']}',
        statusCode: 500,
      );
    }
  }

  @override
  Future<void> getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("x-auth-token");

    if (token != null && token.isNotEmpty) {
      // pref.setString("x-auth-token", '');
      final tokenValidationResponse = await http.post(
          Uri.parse("http://192.168.85.146:3000/tokenIsValide"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            "x-auth-token": token!,
          });
    }

    var tokenResponse = await http.post(
        Uri.parse("http://192.168.85.146:3000/tokenIsValide"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": token!,
        });

    var finalTokenResponse = jsonDecode(tokenResponse.body);

    if (finalTokenResponse == true) {
      http.Response userResponse = await http.get(
          Uri.parse("http://192.168.85.146:3000/"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            "x-auth-token": token,
          });
      // var finalUserResponse = jsonDecode(userResponse.body);
      UserModel.fromJson(userResponse.body);
    }
  }

  @override
  Future<bool> isLoggedInUser() async {
    // final SharedPreferences pref = await SharedPreferences.getInstance();
    // String? token = pref.getString("x-auth-token");
    // return token != null && token.isNotEmpty;

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("x-auth-token");

    if(token != null && token.isNotEmpty) {
      final tokenValidationResponse = await http.post(
          Uri.parse("http://192.168.85.146:3000/tokenIsValid"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            "x-auth-token": token!,
          });


      if (tokenValidationResponse.statusCode == 200) {
        print("Ans : ${jsonDecode(tokenValidationResponse.body)}");
        // _checkedLoggedIn = true;
        // await pref.setBool(
        //     "isTokenValid", jsonDecode(tokenValidationResponse.body));
        return true;
      } else if (tokenValidationResponse.statusCode == 400) {
        print("Ans : ${jsonDecode(tokenValidationResponse.body)}");
        throw ServerException400(
          message: "${jsonDecode(tokenValidationResponse.body)}",
          statusCode: 400,
        );
      } else if (tokenValidationResponse.statusCode == 500) {
        print("Ans : ${jsonDecode(tokenValidationResponse.body)}");
        throw ServerException500(
          message: "${jsonDecode(tokenValidationResponse.body)}",
          statusCode: 500,
        );
      } else {
        print("Ans : ${jsonDecode(tokenValidationResponse.body)}");
        return false;
      }
    } else {
      return false;
    }
  }
}


