import 'package:doctorum/domain/use_case/firestore/firestore.dart';
import 'package:doctorum/resource/langs/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctorum/resource/const/colors.dart';
import 'package:doctorum/presentation/navigation/navgation.dart';
import 'package:doctorum/domain/entity/doctor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SearchInput(),
            const SizedBox(
              height: 20,
            ),
            Text(
              LocaleKeys.topDoctorTitle.tr(),
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: TopDoctorCard()),
            ElevatedButton(
              onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Add Doctor Form'),
                content: const AddDoctorForm(),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddDoctorForm extends StatelessWidget {
  const AddDoctorForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController experiences = TextEditingController();
    TextEditingController doctorTitle = TextEditingController();
    TextEditingController about = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: name,
            decoration: const InputDecoration(hintText: "name"),
          ),
          TextField(
            controller: lastName,
            decoration: const InputDecoration(hintText: "lastName"),
          ),
          TextField(
            controller: experiences,
            decoration: const InputDecoration(hintText: "experiences"),
          ),
          TextField(
            controller: doctorTitle,
            decoration: const InputDecoration(hintText: "doctorTitle"),
          ),
          TextField(
            controller: about,
            decoration: const InputDecoration(hintText: "about"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (name.text.isNotEmpty &&
                  lastName.text.isNotEmpty &&
                  experiences.text.isNotEmpty &&
                  doctorTitle.text.isNotEmpty &&
                  about.text.isNotEmpty) {
                await FirestoreCRUD().addDoctor(
                  name: name.text,
                  lastName: lastName.text,
                  experiences: int.parse(experiences.text),
                  about: about.text,
                  doctorTitle: doctorTitle.text,
                );
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  //final String img;
  //final String doctorName;
  //final String doctorTitle;

  const TopDoctorCard({
    super.key,
    //required this.img,
    //required this.doctorName,
    //required this.doctorTitle,
  });

  @override
  Widget build(BuildContext context) {
    FirestoreCRUD firestoreCRUD = FirestoreCRUD();

    return FutureBuilder(
      future: firestoreCRUD.getDoctors(),
      builder: (BuildContext context, AsyncSnapshot<List<Doctor>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteNames.doctorDetail,
                        arguments: snapshot.data![index]);
                  },
                  child: Row(
                    children: [
                      Container(
                        color: AppColors.backgroundColor2,
                        child: const Image(
                          width: 100,
                          image: AssetImage('assets/doctor.jpeg'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data![index].name} ${snapshot.data![index].lastName}',
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            snapshot.data![index].doctorTitle,
                            style: const TextStyle(
                              color: AppColors.textDisablesColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.orangeColor,
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '4.0 - 50 Reviews',
                                style: TextStyle(
                                    color: AppColors.textDisablesColor),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor2,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: AppColors.textDisablesColor,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: LocaleKeys.searchTitle.tr(),
                hintStyle: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textDisablesColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
