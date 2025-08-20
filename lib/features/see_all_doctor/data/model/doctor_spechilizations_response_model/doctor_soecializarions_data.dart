import 'doctor.dart';

class DoctorSpecializationsData {
	int? id;
	String? name;
	List<Doctor>? doctors;

	DoctorSpecializationsData({this.id, this.name, this.doctors});

	factory DoctorSpecializationsData.fromJson(Map<String, dynamic> json) => DoctorSpecializationsData(
				id: json['id'] as int?,
				name: json['name'] as String?,
				doctors: (json['doctors'] as List<dynamic>?)
						?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'doctors': doctors?.map((e) => e.toJson()).toList(),
			};
}
