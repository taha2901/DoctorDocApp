class UpdateProfileRequestBody {
  final String name;
  final String email;
  final String phone;
  final String gender; // هتبعته بس، مش هتستخدمه في الواجهة
  final String password;
  final String passwordConfirmation; // نفس الشيء

  UpdateProfileRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    this.gender = '0', // قيمة افتراضية لو مش هتعدل عليه
    required this.password,
    this.passwordConfirmation = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
