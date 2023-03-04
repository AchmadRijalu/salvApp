class SigninFormModel {
  final String? username;
  final String? password;

  SigninFormModel({this.username, this.password});

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
