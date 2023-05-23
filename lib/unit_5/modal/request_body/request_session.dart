import 'dart:convert';

class RequestSession {
  RequestSession({
    this.requestToken,
  });

  String? requestToken;

  factory RequestSession.fromRawJson(String str) =>
      RequestSession.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestSession.fromJson(Map<String, dynamic> json) => RequestSession(
    requestToken: json["request_token"],
  );

  Map<String, dynamic> toJson() => {
    "request_token": requestToken,
  };
}
