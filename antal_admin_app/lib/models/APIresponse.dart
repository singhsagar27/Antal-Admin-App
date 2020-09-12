class APIResponse<T> {
  T data;
  bool error;
  String errorMessage;
  String successMessage;
  String LoginName;
  String LoginMobile;

  APIResponse({this.data, this.errorMessage, this.error=false, this.successMessage, this.LoginName, this.LoginMobile, id});

  Object get id => null;

}