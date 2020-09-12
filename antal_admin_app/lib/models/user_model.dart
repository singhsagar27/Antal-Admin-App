class UserModel {

  String UserMobile;
  String UserPassword;
  String UserToken;


  UserModel({this.UserMobile, this.UserPassword, this.UserToken});

  factory UserModel.fromJson(Map<String, dynamic> item) {
    return UserModel(
      UserMobile: item['UserMobile'],
      UserPassword: item['UserPassword'],
      UserToken: item['UserToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mobile": UserMobile,
      "password": UserPassword,
      "token": UserPassword
    };
  }
}