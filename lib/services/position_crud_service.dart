import 'service.dart';  
import 'package:leads_in/models/position_model.dart';
import 'package:leads_in/models/APIresponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PositionService extends APIService {

  static Future<APIResponse<bool>> position_api(PositionModel item) {
        return http.post(APIService.API + 'api/sales_partner/position', headers: APIService.headers, body: json.encode(item.toJson())).then((data) {

          
          var list = json.decode(data.body);
          print(data.statusCode);
          print(list);
          if (data.statusCode == 201) {
            print("list22 :");
            print(list);
            print(json.decode(data.body));
            return APIResponse<bool>(data: true,successMessage:json.decode(data.body)['client_name']);
          }
          return APIResponse<bool>(error: true,data: false, errorMessage: list['Error']);

        })
            .catchError((e) => APIResponse<bool>(error: true,data: false, errorMessage: e.toString()+" Conn Error"));

      }

  static Future<APIResponse<List<PositionModel>>> get_position_list_api() {
      return http.get(APIService.API + 'api/sales_partner/position', headers: APIService.headers)
      .then((data) {    
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          final notes = <PositionModel>[];
          for (var item in jsonData){
            notes.add(PositionModel.fromJson(item));
          }
          print("jsonData");
          print(jsonData);
         
          return APIResponse<List<PositionModel>>(data: notes);
        }
        return APIResponse<List<PositionModel>>(error: true);

      })
          .catchError((e) => APIResponse<List<PositionModel>>(error: true, errorMessage: e.toString()+" Conn Error"));

    }

  static Future<APIResponse<PositionModel>> get_position_api(String positionID) {   
      return http.get(APIService.API + 'api/sales_partner/update_position/'+positionID , headers: APIService.headers)
      .then((data) {    
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);

          return APIResponse<PositionModel>(data: PositionModel.fromJson(jsonData));
          
        }
        return APIResponse<PositionModel>(error: true);

      })
          .catchError((e) => APIResponse<PositionModel>(error: true, errorMessage: e.toString()+" Conn Error"));

    }
    
  static Future<APIResponse<bool>> update_position_api(String positionID, PositionModel item) {

      return http.post(API + 'api/sales_partner/update_position/'+ positionID , headers: headers, body: json.encode(item.toJson())).then((data) {
        var list = json.decode(data.body);
        print(data.statusCode);
        print(list);
        if (data.statusCode == 200) {
          return APIResponse<bool>(data: true,successMessage:json.decode(data.body)['client_name']);
        }
        return APIResponse<bool>(error: true,data: false, errorMessage: list['Error']);

      })
          .catchError((e) => APIResponse<bool>(error: true,data: false, errorMessage: e.toString()+" Conn Error"));

  }
}