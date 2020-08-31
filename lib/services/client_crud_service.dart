

  static Future<APIResponse<bool>> client_api(ClientModel item) {
    return http.post(API + 'api/admin/client', headers: headers, body: json.encode(item.toJson())).then((data) {

      
      var list = json.decode(data.body);
      print(data.statusCode);
      print(list);
      if (data.statusCode == 201) {
        print("list22 :");
        print(list);
        print(json.decode(data.body));
        return APIResponse<bool>(data: true,successMessage:json.decode(data.body)['member_name']);
      }
      return APIResponse<bool>(error: true,data: false, errorMessage: list['Error']);

    })
        .catchError((e) => APIResponse<bool>(error: true,data: false, errorMessage: e.toString()+" Conn Error"));

  }

  static Future<APIResponse<List<ClientModel>>> get_client_list_api() {
    return http.get(API + 'api/admin/client', headers: headers)
    .then((data) {    
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <ClientModel>[];
        for (var item in jsonData){
          notes.add(ClientModel.fromJson(item));
        }
        return APIResponse<List<ClientModel>>(data: notes);
      }
      return APIResponse<List<ClientModel>>(error: true);

    })
        .catchError((e) => APIResponse<List<ClientModel>>(error: true, errorMessage: e.toString()+" Conn Error"));

  }