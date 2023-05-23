class SessionModal {
  bool? success;
  String? sessionId;

  SessionModal({this.success, this.sessionId});

  SessionModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['session_id'] = sessionId;
    return data;
  }
}
