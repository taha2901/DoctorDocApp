import 'doctor_soecializarions_data.dart';

class DoctorSpecializationsResponseModel {
	String? message;
	List<DoctorSpecializationsData>? data;
	bool? status;
	int? code;

	DoctorSpecializationsResponseModel({
		this.message, 
		this.data, 
		this.status, 
		this.code, 
	});

	factory DoctorSpecializationsResponseModel.fromJson(Map<String, dynamic> json) {
		return DoctorSpecializationsResponseModel(
			message: json['message'] as String?,
			data: (json['data'] as List<dynamic>?)
						?.map((e) => DoctorSpecializationsData.fromJson(e as Map<String, dynamic>))
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
