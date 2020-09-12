import 'dart:convert';
import 'package:leads_in/models/APIresponse.dart';
import 'package:leads_in/models/change_pass_model.dart';
import 'package:leads_in/models/client_model.dart';
import 'package:leads_in/models/company_model.dart';
import 'package:leads_in/models/login_model.dart';
import 'package:leads_in/models/position_model.dart';
import 'package:http/http.dart' as http;
import 'package:leads_in/models/common.dart';



class APIService {
//  static const API = 'https://c4864295cf4e.ngrok.io:8000';
  static const API = 'http://192.168.31.133:8000/';
  static const headers = {

//    'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json',
  };
  static var auth_headers = {
      'Authorization': 'Token ' + Common.currentUser.UserToken,
  };
  
}