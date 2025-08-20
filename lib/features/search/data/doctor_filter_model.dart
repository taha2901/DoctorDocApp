import 'package:json_annotation/json_annotation.dart';

part 'doctor_filter_model.g.dart';

@JsonSerializable()
class SearchResponseModel {
  final List<DoctorFilterResponseModel> data;

  SearchResponseModel({required this.data});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);
}
@JsonSerializable()
class DoctorFilterResponseModel {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  @JsonKey(name: 'photo')
  final String? image;

  DoctorFilterResponseModel({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.image,
  });

  factory DoctorFilterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorFilterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorFilterResponseModelToJson(this);
}
