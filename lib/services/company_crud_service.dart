import 'package:leads_in/models/company_model.dart';

import 'service.dart';
import 'package:leads_in/models/position_model.dart';
import 'package:leads_in/models/APIresponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<APIResponse<bool>> company_api(CompanyModel item) {
  return http
      .post(APIService.API + 'api/sales_partner/company',
          headers: APIService.headers, body: json.encode(item.toJson()))
      .then((data) {
    var list = json.decode(data.body);
    print(data.statusCode);
    print(list);
    if (data.statusCode == 201) {
      print("list22 :");
      print(list);
      print(json.decode(data.body));
      return APIResponse<bool>(
          data: true, successMessage: json.decode(data.body)['company_name']);
    }
    return APIResponse<bool>(
        error: true, data: false, errorMessage: list['Error']);
  }).catchError((e) => APIResponse<bool>(
          error: true,
          data: false,
          errorMessage: e.toString() + " Conn Error"));
}

Future<APIResponse<List<CompanyModel>>> get_company_list_api() {
  return http
      .get(APIService.API + 'api/sales_partner/company',
          headers: APIService.headers)
      .then((data) {
    if (data.statusCode == 200) {
      final jsonData = json.decode(data.body);
      final notes = <CompanyModel>[];
      for (var item in jsonData) {
        notes.add(CompanyModel.fromJson(item));
      }
      return APIResponse<List<CompanyModel>>(data: notes);
    }
    return APIResponse<List<CompanyModel>>(error: true);
  }).catchError((e) => APIResponse<List<CompanyModel>>(
          error: true, errorMessage: e.toString() + " Conn Error"));
}
