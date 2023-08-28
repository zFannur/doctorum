import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  final String doctorName;
  final String doctorTitle;
  final String reservedDate;
  final String reservedTime;
  final String status;

  Appointment({
    required this.doctorName,
    required this.doctorTitle,
    required this.reservedDate,
    required this.reservedTime,
    required this.status,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}