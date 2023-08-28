import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorum/domain/entity/appointment.dart';
import 'package:doctorum/domain/entity/doctor.dart';

const doctorsCollection = 'doctors';
const appointmentCollection = 'appointment';

class FirestoreCRUD {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addAppointment({
    required String doctorName,
    required String doctorTitle,
    required String reservedDate,
    required String reservedTime,
    required String status,
  }) {
    CollectionReference data =
    FirebaseFirestore.instance.collection(appointmentCollection);

    return data
        .add({
      'doctorName': doctorName,
      'doctorTitle': doctorTitle,
      'reservedDate': reservedDate,
      'reservedTime': reservedTime,
      'status': status,
    })
        .then((value) => print('appointment Added'))
        .catchError((error) => print('Failed to add appointment: $error'));
  }

  Future<List<Appointment>> getAppointment() async {
    List<Appointment> doctorsList;
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection(appointmentCollection).get();
    doctorsList = querySnapshot.docs
        .map((e) => Appointment.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    return doctorsList;
  }

  Future<void> addDoctor({
    required String name,
    required String lastName,
    required int experiences,
    required String doctorTitle,
    required String about,
  }) {
    CollectionReference data =
        FirebaseFirestore.instance.collection(doctorsCollection);

    return data
        .add({
          'name': name,
          'lastName': lastName,
          'experiences': experiences,
          'doctorTitle': doctorTitle,
          'about': about
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to add user: $error'));
  }

  Future<List<Doctor>> getDoctors() async {
    List<Doctor> doctorsList;
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(doctorsCollection).get();
    doctorsList = querySnapshot.docs
        .map((e) => Doctor.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    return doctorsList;
  }
}
