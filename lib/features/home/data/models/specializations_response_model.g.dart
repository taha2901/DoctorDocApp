// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specializations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationsResponseModel _$SpecializationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    SpecializationsResponseModel(
      specializationDataList: (json['data'] as List<dynamic>?)
          ?.map((e) => SpecializationsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SpecializationsResponseModelToJson(
        SpecializationsResponseModel instance) =>
    <String, dynamic>{
      'data': instance.specializationDataList,
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };

SpecializationsData _$SpecializationsDataFromJson(Map<String, dynamic> json) =>
    SpecializationsData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      doctorsList: (json['doctors'] as List<dynamic>?)
          ?.map((e) => Doctors.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationsDataToJson(
        SpecializationsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctorsList,
    };

Doctors _$DoctorsFromJson(Map<String, dynamic> json) => Doctors(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      degree: json['degree'] as String?,
      price: (json['appoint_price'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      specialization: json['specialization'] == null
          ? null
          : Specialization.fromJson(
              json['specialization'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorsToJson(Doctors instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.photo,
      'gender': instance.gender,
      'address': instance.address,
      'description': instance.description,
      'degree': instance.degree,
      'appoint_price': instance.price,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'specialization': instance.specialization,
      'city': instance.city,
    };

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpecializationToJson(Specialization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      governrate: json['governrate'] == null
          ? null
          : Governrate.fromJson(json['governrate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'governrate': instance.governrate,
    };

Governrate _$GovernrateFromJson(Map<String, dynamic> json) => Governrate(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GovernrateToJson(Governrate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
