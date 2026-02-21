// برضو بيتغير من بروجكت للتاني 

import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';
@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  final Map<String, dynamic>? data; // <-- إضافة هذا

  ApiErrorModel({
    required this.message,
    this.code,
    this.data,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'code': code,
        'data': data,
      };
}
