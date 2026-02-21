class UpdateProfileRequestBody {
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;
  final String? password;
  final String? passwordConfirmation;

  UpdateProfileRequestBody({
    this.name,
    this.email,
    this.phone,
    this.gender = '0',
    this.password,
    this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (name != null) data['name'] = name;
    if (email != null) data['email'] = email;
    if (phone != null) data['phone'] = phone;
    if (gender != null) data['gender'] = gender;
    if (password != null && password!.isNotEmpty) {
      data['password'] = password;
      data['password_confirmation'] = password;
    }

    return data;
  }
}
