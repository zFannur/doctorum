import 'package:doctorum/domain/entity/doctor.dart';
import 'package:doctorum/domain/use_case/firestore/firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:doctorum/resource/const/colors.dart';
import 'package:doctorum/resource/const/textStyles.dart';

import 'package:doctorum/resource/langs/locale_keys.g.dart';

String _tapTime = '';

class DoctorDetail extends StatelessWidget {
  const DoctorDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(LocaleKeys.doctorDetailTitle.tr()),
            backgroundColor: AppColors.primaryColor,
            expandedHeight: 200,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/hospital.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: DetailBody(),
          )
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    final arguments = (ModalRoute.of(context)?.settings.arguments) as Doctor;
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DetailDoctorCard(),
          const SizedBox(
            height: 15,
          ),
          Text(
            LocaleKeys.aboutDoctorTitle.tr(),
            style: kTitleStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            arguments.about,
            style: const TextStyle(
              color: AppColors.textDisablesColor,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            LocaleKeys.timeToAppointmentTitle.tr(),
            style: kTitleStyle,
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () async {
               selectedDate = await _selectDate(context, selectedDate);
            },
            child: Text(
              'Select Date',
              style: kTitleStyle,
            ),
          ),
          const TimeToAppointment(),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.primaryColor,
              ),
            ),
            child: Text(LocaleKeys.appointmentTitle.tr()),
            onPressed: () {
              FirestoreCRUD().addAppointment(
                doctorName: arguments.name,
                doctorTitle: arguments.doctorTitle,
                reservedDate: selectedDate.toString(),
                reservedTime: _tapTime,
                status: 'upcoming',
              );
              _tapTime = "";
              selectedDate = DateTime.now();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Future<DateTime> _selectDate(
      BuildContext context, DateTime selectedDate) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
    }
    return selectedDate;
  }
}

class TimeToAppointment extends StatefulWidget {
  const TimeToAppointment({super.key});

  @override
  State<TimeToAppointment> createState() => _TimeToAppointmentState();
}

class _TimeToAppointmentState extends State<TimeToAppointment> {
  List<String> time = [
    '9-10',
    '10-11',
    '11-12',
    '12-13',
    '13-14',
    '14-15',
    '15-16',
    '16-17',
    '17-18',
    '18-19'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      time.length,
      (int index) {
        return InkWell(
          onTap: () {
            _tapTime = time[index];
            setState(() {});
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: _tapTime == time[index]
                    ? AppColors.primaryColor
                    : AppColors.backgroundColor2,
                borderRadius: BorderRadius.circular(16)),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 20,
            height: 50,
            child: Text(
              time[index],
              style: kTitleStyle,
            ),
          ),
        );
      },
    ));
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NumberCard(
          label: LocaleKeys.patientsTitle.tr(),
          value: '100+',
        ),
        const SizedBox(width: 15),
        NumberCard(
          label: LocaleKeys.experiencesTitle.tr(),
          value: '10 years',
        ),
        const SizedBox(width: 15),
        NumberCard(
          label: LocaleKeys.ratingTitle.tr(),
          value: '4.0',
        ),
      ],
    );
  }
}

class AboutDoctor extends StatelessWidget {
  final String title;
  final String desc;

  const AboutDoctor({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NumberCard extends StatelessWidget {
  final String label;
  final String value;

  const NumberCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.backgroundColor2,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textDisablesColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailDoctorCard extends StatelessWidget {
  const DetailDoctorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments) as Doctor;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${arguments.name} ${arguments.lastName}",
                    style: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    arguments.doctorTitle,
                    style: const TextStyle(
                      color: AppColors.textDisablesColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Image(
              image: AssetImage('assets/doctor.jpeg'),
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}
