class ChangePassModel {

  // ignore: non_constant_identifier_names
  String UserMobile;
  String UserPass;
  String OldPass;


  ChangePassModel({this.UserMobile, this.UserPass,this.OldPass});

  factory ChangePassModel.fromJson(Map<String, dynamic> item) {
    return ChangePassModel(
      UserMobile: item['UserMobile'],
      UserPass: item['UserPass'],
      OldPass: item['OldPass'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "UserMobile": UserMobile,
      "UserPass": UserPass,
      "OldPass": OldPass
    };
  }
}