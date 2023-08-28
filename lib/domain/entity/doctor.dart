import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  final String name;
  final String lastName;
  final int experiences;
  final String doctorTitle;
  final String about;

  Doctor({
    required this.name,
    required this.lastName,
    required this.experiences,
    required this.doctorTitle,
    required this.about,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
