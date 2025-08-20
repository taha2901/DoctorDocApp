class LogoutResponseBody {
  String? message;
  List<dynamic>? data;
  bool? status;
  int? code;

  LogoutResponseBody({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  factory LogoutResponseBody.fromJson(Map<String, dynamic> json) {
    return LogoutResponseBody(
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data,
    'status': status,
    'code': code,
  };
}