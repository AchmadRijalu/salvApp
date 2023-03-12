class SigninFormModel {
  final String? username;
  final String? password;
  final String? type;

  SigninFormModel({this.username, this.password, this.type});

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password, 'type': type};
  }
}
