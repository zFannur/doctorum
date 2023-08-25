import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:doctorum/const/colors.dart';
import 'package:doctorum/const/textStyles.dart';

import 'package:doctorum/resource/langs/locale_keys.g.dart';

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
          const DoctorInfo(),
          const SizedBox(
            height: 30,
          ),
          Text(
            LocaleKeys.aboutDoctorTitle.tr(),
            style: kTitleStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Dr. Joshua Simorangkir is a specialist in internal medicine who specialzed blah blah.',
            style: TextStyle(
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
            onPressed: () => {},
          )
        ],
      ),
    );
  }
}

class TimeToAppointment extends StatelessWidget {
  const TimeToAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Josua Simorangkir',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Heart Specialist',
                    style: TextStyle(
                      color: AppColors.textDisablesColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Image(
              image: AssetImage('assets/doctor01.jpeg'),
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}
