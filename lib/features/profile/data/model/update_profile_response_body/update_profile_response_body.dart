import 'data.dart';

class UpdateProfileResponseBody {
	String? message;
	UpdateProfileData? data;
	bool? status;
	int? code;

	UpdateProfileResponseBody({
		this.message, 
		this.data, 
		this.status, 
		this.code, 
	});

	factory UpdateProfileResponseBody.fromJson(Map<String, dynamic> json) {
		return UpdateProfileResponseBody(
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: UpdateProfileData.fromJson(json['data'] as Map<String, dynamic>),
			status: json['status'] as bool?,
			code: json['code'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
				'status': status,
				'code': code,
			};
}
