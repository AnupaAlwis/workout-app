import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_full/constants/colors.dart';
import 'package:workout_planner_full/constants/responsiveness.dart';
import 'package:workout_planner_full/data/equipment_data.dart';
import 'package:workout_planner_full/data/exercise_data.dart';
import 'package:workout_planner_full/data/user_data.dart';
import 'package:workout_planner_full/models/equipment_model.dart';
import 'package:workout_planner_full/models/exercise_model.dart';
import 'package:workout_planner_full/widgets/favorite_card.dart';
import 'package:workout_planner_full/widgets/progress_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Date formatters
  final DateFormat formatter = DateFormat("EEEE , MMMM ");
  final DateFormat dayFormat = DateFormat("dd");

  //Get exercise list and equipment list
  final exerciseList = ExerciseData().exercisesList;
  final equipmentsList = EquipmentData().equipmentList;
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "$formattedDate  $formatterDate",
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: kSubtitleColor),
        ),
        Text("Hello, ${userData.fullName}",
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor)),
        const SizedBox(
          height: 10,
        ),
        ProgressBar(total: userData.calculateTotalCaloriesBurned(), progressValue: 0.1),
        const SizedBox(
          height: 10,
        ),
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: kSubtitleColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total number of minutes spend : ${userData.totalNumberOfMinutedSpend().toString()}",
                      style: const TextStyle(
                          color: kMainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Total number of exercise completed : ${userData.totalExercisesCompleted}",
                      style: const TextStyle(
                          color: kMainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Total number of equipments Hand overed  :  ${userData.totalEquipmentsHandOvered}",
                      style: const TextStyle(
                          color: kMainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
            )),
        const Text(
          "Your Exercises",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: kMainBlackColor),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          itemCount: userData.exerciseList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Exercise exercise = userData.exerciseList[index];
            return FavoriteCard(
                imageUrl: exercise.exerciseImageUrl,
                exerciseName: exercise.exerciseName,
                completed: () {
                  userData.completeExercise(exercise.id);
                });
          },
        ),
        const Text(
          "Your Equipments",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: kMainBlackColor),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          itemCount: userData.equipmentList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Equipment equipment = userData.equipmentList[index];
            return FavoriteCard(
                imageUrl: equipment.equipmentImageUrl,
                exerciseName: equipment.equipmentName,
                completed: () {
                  setState(() {
                    userData.handOvered(equipment.id);
                  });
                });
          },
        )
      ]),
    ))));
  }
}
