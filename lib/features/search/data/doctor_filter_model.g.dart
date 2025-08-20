// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) =>
    SearchResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              DoctorFilterResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseModelToJson(
        SearchResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DoctorFilterResponseModel _$DoctorFilterResponseModelFromJson(
        Map<String, dynamic> json) =>
    DoctorFilterResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['photo'] as String?,
    );

Map<String, dynamic> _$DoctorFilterResponseModelToJson(
        DoctorFilterResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.image,
    };
