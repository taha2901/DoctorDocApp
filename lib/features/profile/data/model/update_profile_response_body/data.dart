class UpdateProfileData {
	int? id;
	String? name;
	String? email;
	String? phone;
	String? gender;
	dynamic emailVerifiedAt;
	DateTime? createdAt;
	DateTime? updatedAt;

	UpdateProfileData({
		this.id, 
		this.name, 
		this.email, 
		this.phone, 
		this.gender, 
		this.emailVerifiedAt, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory UpdateProfileData.fromJson(Map<String, dynamic> json) => UpdateProfileData(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
				gender: json['gender'] as String?,
				emailVerifiedAt: json['email_verified_at'] as dynamic,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'phone': phone,
				'gender': gender,
				'email_verified_at': emailVerifiedAt,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};
}
