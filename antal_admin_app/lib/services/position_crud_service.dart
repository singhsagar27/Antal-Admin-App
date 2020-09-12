import 'package:leads_in/models/admin_company.dart';
import 'package:leads_in/models/common.dart';

import 'service.dart';
import 'package:leads_in/models/position_model.dart';
import 'package:leads_in/models/APIresponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PositionService extends APIService {

  static Future<APIResponse<PositionModel>> position_api(PositionModel item) {
    return http
        .post(APIService.API + 'api/sales_partner/position',
            headers: { 'Content-type': 'application/json',
              'Authorization': 'Token ' + Common.currentUser.UserToken,}  , body: json.encode(item.toJson()))
        .then((data) {
      var list = json.decode(data.body);
      print('statusCode');
      print(data);
      print(list);
      if (data.statusCode == 201) {
        final jsonData = json.decode(data.body);
        return APIResponse<PositionModel>(data: PositionModel.fromJson(jsonData));
      }
      return APIResponse<PositionModel>(
          error: true,  errorMessage: list['Error']);
    }).catchError((e) => APIResponse<PositionModel>(
            error: true,
            errorMessage: e.toString() + " Conn Error"));
  }

  static Future<APIResponse<AdminCompanyModel>> get_position_client_api()  {
    return http
        .get(APIService.API + 'api/sales_partner/position' ,
            headers: {'Content-type': 'application/json',
              'Authorization': 'Token ' + Common.currentUser.UserToken,})
        .then((data) {
          print(Common.currentUser.UserToken);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print('jsonData');
        print(jsonData);
    
        return APIResponse<AdminCompanyModel>(data: AdminCompanyModel.fromJson(jsonData));

      }
      return APIResponse<AdminCompanyModel>(error: true);
    }).catchError((e) => APIResponse<AdminCompanyModel>(
            error: true, errorMessage: e.toString() + " Conn Error"));
  }

  static Future<APIResponse<PositionModel>> get_position_api(
      String positionID) {
    return http
        .get(APIService.API + 'api/sales_partner/update_position/' + positionID,
            headers: APIService.headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        return APIResponse<PositionModel>(
            data: PositionModel.fromJson(jsonData));
      }
      return APIResponse<PositionModel>(error: true);
    }).catchError((e) => APIResponse<PositionModel>(
            error: true, errorMessage: e.toString() + " Conn Error"));
  }

  static Future<APIResponse<bool>> update_position_api(
      String positionID, PositionModel item) {
    return http
        .post(
            APIService.API + 'api/sales_partner/update_position/' + positionID,
            headers: APIService.headers,
            body: json.encode(item.toJson()))
        .then((data) {
      var list = json.decode(data.body);
      print(data.statusCode);
      print(list);
      if (data.statusCode == 200) {
        return APIResponse<bool>(
            data: true, successMessage: json.decode(data.body)['client_name']);
      }
      return APIResponse<bool>(
          error: true, data: false, errorMessage: list['Error']);
    }).catchError((e) => APIResponse<bool>(
            error: true,
            data: false,
            errorMessage: e.toString() + " Conn Error"));
  }
}
