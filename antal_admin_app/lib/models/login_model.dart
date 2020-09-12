class LoginModel {

  String UserMobile;
  String UserPass;


  LoginModel({this.UserMobile, this.UserPass,});

  factory LoginModel.fromJson(Map<String, dynamic> item) {
    return LoginModel(
      UserMobile: item['UserMobile'],
      UserPass: item['UserPass'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mobile": UserMobile,
      "password": UserPass
    };
  }
}