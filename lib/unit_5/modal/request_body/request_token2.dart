import 'dart:convert';

class RequestToken2 {
  RequestToken2({
    this.userName,
    this.requestToken,
    this.password,
  });

  String? userName;
  String? password;
  String? requestToken;

  factory RequestToken2.fromRawJson(String str) =>
      RequestToken2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestToken2.fromJson(Map<String, dynamic> json) => RequestToken2(
        userName: json["username"],
        password: json["password"],
        requestToken: json["request_token"],
      );

  Map<String, dynamic> toJson() => {
        "username": userName,
        "password": password,
        "request_token": requestToken,
      };
}
