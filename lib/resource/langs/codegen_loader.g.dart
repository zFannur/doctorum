// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "logOutTitle": "LogOut",
  "emailTitle": "Email",
  "passwordTitle": "Password",
  "logInTitle": "LogIn",
  "signInTitle": "SignIn",
  "resetPasswordTitle": "Reset password",
  "checkEmailTitle": "check your mail",
  "doctorDetailTitle": "Detail Doctor",
  "aboutDoctorTitle": "About Doctor",
  "locationTitle": "Location",
  "appointmentTitle": "Appointment",
  "timeToAppointmentTitle": "Time to appointment",
  "searchTitle": "Search a doctor or health issue",
  "scheduleTitle": "Schedule",
  "cancelTitle": "Cancel",
  "rescheduleTitle": "Reschedule",
  "topDoctorTitle": "Top Doctor",
  "patientsTitle": "Patients",
  "ratingTitle": "Rating",
  "experiencesTitle": "Experiences",
  "homeTitle": "Home",
  "notesTitle": "Notes",
  "accountTitle": "Account"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
