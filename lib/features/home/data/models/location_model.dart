import 'package:doc/features/home/data/models/specializations_response_model.dart';

class DoctorWithLocation {
  final Doctors doctor;
  final double? latitude;
  final double? longitude;
  final double? distanceFromUser;
  final DateTime? coordinatesUpdatedAt;

  DoctorWithLocation({
    required this.doctor,
    this.latitude,
    this.longitude,
    this.distanceFromUser,
    this.coordinatesUpdatedAt,
  });

  // إنشاء نسخة جديدة مع تحديث الإحداثيات
  DoctorWithLocation copyWith({
    Doctors? doctor,
    double? latitude,
    double? longitude,
    double? distanceFromUser,
    DateTime? coordinatesUpdatedAt,
  }) {
    return DoctorWithLocation(
      doctor: doctor ?? this.doctor,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      distanceFromUser: distanceFromUser ?? this.distanceFromUser,
      coordinatesUpdatedAt: coordinatesUpdatedAt ?? this.coordinatesUpdatedAt,
    );
  }

  // تحقق من صحة الإحداثيات
  bool get hasValidCoordinates => 
      latitude != null && longitude != null;

  // تحويل المسافة للعرض
  String get formattedDistance {
    if (distanceFromUser == null) return '';
    
    if (distanceFromUser! >= 1000) {
      return '${(distanceFromUser! / 1000).toStringAsFixed(1)} كم';
    } else {
      return '${distanceFromUser!.toInt()} م';
    }
  }

  // تحقق من انتهاء صلاحية الإحداثيات (24 ساعة)
  bool get coordinatesExpired {
    if (coordinatesUpdatedAt == null) return true;
    return DateTime.now().difference(coordinatesUpdatedAt!).inHours > 24;
  }
}
