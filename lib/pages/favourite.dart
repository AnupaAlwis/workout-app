import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_full/constants/colors.dart';
import 'package:workout_planner_full/constants/responsiveness.dart';
import 'package:workout_planner_full/data/equipment_data.dart';
import 'package:workout_planner_full/data/exercise_data.dart';
import 'package:workout_planner_full/data/user_data.dart';
import 'package:workout_planner_full/models/equipment_model.dart';
import 'package:workout_planner_full/models/exercise_model.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  //Date formatters
  final DateFormat formatter = DateFormat("EEEE , MMMM ");
  final DateFormat dayFormat = DateFormat("dd");

  //Get exercise list and equipment list
  final exerciseList = ExerciseData().exercisesList;
  final equipmentsList = EquipmentData().equipmentList;

  //User data
  final userData = user;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now(); // get today's date
    String formattedDate = formatter.format(now); // format the date
    String formatterDate = dayFormat.format(now);
    return SafeArea(
        // ignore: unnecessary_const
        child: Scaffold(
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$formattedDate  $formatterDate",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: kSubtitleColor),
                          ),
                          Text("Hello, ${userData.fullName}",
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: kMainBlackColor)),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "All your favourite workouts are here",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: kMainColor),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: kDefaultPadding,
                              mainAxisSpacing: kDefaultPadding,
                              childAspectRatio: 16/19,
                            ),
                            itemCount: userData.favExerciseList.length,
                            itemBuilder: (context, index) {
                              Exercise favExercise =
                                  userData.favExerciseList[index];
                              return Card(
                                color: kCardbgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        favExercise.exerciseName,
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: kMainBlackColor,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset(
                                        favExercise.exerciseImageUrl,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${favExercise.noOfMinutes.toString()} minutes",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: kMainColor),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "All your favourite equipments are here",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: kMainColor),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: kDefaultPadding,
                              mainAxisSpacing: kDefaultPadding,
                              childAspectRatio: 16/23,
                            ),
                            itemCount: userData.favEquipmentList.length,
                            itemBuilder: (context, index) {
                              Equipment favEquipment = userData.favEquipmentList[index];
                              return Card(
                                color: kCardbgColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        favEquipment.equipmentName,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: kMainBlackColor,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset(
                                        favEquipment.equipmentImageUrl,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        favEquipment.equipmentDescription,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: kMainColor),
                                            textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ])))));
  }
}
