import 'service.dart';  
import 'package:leads_in/models/login_model.dart';
import 'package:leads_in/models/APIresponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:leads_in/models/change_pass_model.dart';

class Auth extends APIService{
  static Future<APIResponse<bool>> login_api(LoginModel item) {
      return http.post(APIService.API + 'api/auth/login', headers: APIService.headers, body: json.encode(item.toJson())).then((data) {

        print(data.statusCode);

        var list = json.decode(data.body);
  //      var list = json.decode(data.body) as List;

        if (data.statusCode == 200) {
          print("list22 :");
          print(list);
          print(json.decode(data.body));
          return APIResponse<bool>(data: true,successMessage:json.decode(data.body)['token']);
        }if (data.statusCode == 201) {
          print("list :");
          print(list['Error']);
          return APIResponse<bool>(error: true,data: false, errorMessage: list['Error']);
        }

        return APIResponse<bool>(error: true,data: false, errorMessage: list['Error']);

      })
          .catchError((e) => APIResponse<bool>(error: true,data: false, errorMessage: e.toString()+" Conn Error"));

    }

  static Future<APIResponse<bool>> change_password_api(ChangePassModel item) {
    return http.post(APIService.API + 'api/change-password/', headers: APIService.headers, body: json.encode(item.toJson())).then((data) {

      print(data.statusCode);

      var list = json.decode(data.body);

      if (data.statusCode == 200) {
        print("list22 :");
        print(list);
        print(json.decode(data.body));
        return APIResponse<bool>(data: true,successMessage:json.decode(data.body)['result']);
      }
      return APIResponse<bool>(error: true,data: false, errorMessage: list['Error']);

    })
        .catchError((e) => APIResponse<bool>(error: true,data: false, errorMessage: e.toString()+" Conn Error"));

  }

  static Future<APIResponse<bool>> forgot_password_api(LoginModel item) {
    return http.post(APIService.API + 'api/password_reset/', headers: APIService.headers, body: json.encode(item.toJson())).then((data) {

      print(data.statusCode);
      print(data);
      var list = json.decode(data.body);

      if (data.statusCode == 200) {
        print("list22 :");
        print(list);
        print(json.decode(data.body));
        return APIResponse<bool>(data: true,successMessage:json.decode(data.body)['OTP']);
      }
      return APIResponse<bool>(error: true,data: false, errorMessage: list['Error']);

    })
        .catchError((e) => APIResponse<bool>(error: true,data: false, errorMessage: e.toString()+" Conn Error"));

  }
}