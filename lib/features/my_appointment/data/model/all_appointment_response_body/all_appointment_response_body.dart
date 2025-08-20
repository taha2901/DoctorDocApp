import 'datum.dart';

class AllAppointmentResponseBody {
	String? message;
	List<AppointmentData>? data;
	bool? status;
	int? code;

	AllAppointmentResponseBody({
		this.message, 
		this.data, 
		this.status, 
		this.code, 
	});

	factory AllAppointmentResponseBody.fromJson(Map<String, dynamic> json) {
		return AllAppointmentResponseBody(
			message: json['message'] as String?,
			data: (json['data'] as List<dynamic>?)
						?.map((e) => AppointmentData.fromJson(e as Map<String, dynamic>))
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
