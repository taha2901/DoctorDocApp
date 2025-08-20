import 'profile_data.dart';

class ProfileResponseModel {
	String? message;
	List<ProfileData>? data;
	bool? status;
	int? code;

	ProfileResponseModel({this.message, this.data, this.status, this.code});

	factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
		return ProfileResponseModel(
			message: json['message'] as String?,
			data: (json['data'] as List<dynamic>?)
						?.map((e) => ProfileData.fromJson(e as Map<String, dynamic>))
						.toList(),
			status: json['status'] as bool?,
			code: json['code'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
				'status': status,
				'code': code,
			};
}
