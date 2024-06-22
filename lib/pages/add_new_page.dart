import 'package:flutter/material.dart';
import 'package:workout_planner_full/constants/colors.dart';
import 'package:workout_planner_full/constants/responsiveness.dart';
import 'package:workout_planner_full/data/equipment_data.dart';
import 'package:workout_planner_full/data/exercise_data.dart';
import 'package:workout_planner_full/data/user_data.dart';
import 'package:workout_planner_full/models/equipment_model.dart';
import 'package:workout_planner_full/models/exercise_model.dart';
import 'package:workout_planner_full/widgets/add_equipment_card.dart';
import 'package:workout_planner_full/widgets/add_exercise_widget.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  final userData = user;
  final exerciseList = ExerciseData().exercisesList;
  final favExerciseList = user.favExerciseList;
  final equipmentList = EquipmentData().equipmentList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${userData.fullName}",
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Lets Add Some Workouts and Equipment for today!",
                style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                    color: kMainColor),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.385,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise exercise = exerciseList[index];
                    return AddExerciseCard(
                      exerciseTitle: exercise.exerciseName,
                      exerciseImageUrl: exercise.exerciseImageUrl,
                      noOfMinutes: exercise.noOfMinutes,
                      isAdded: userData.exerciseList.contains(exercise),
                      toggleAddExercise: () {
                        setState(() {
                          if (userData.exerciseList.contains(exercise)) {
                            userData.removeExercise(exercise);
                          } else {
                            userData.addExercise(exercise);
                          }
                        });
                      },
                      toggleAddFavExercise: () {
                        setState(() {
                          if (userData.favExerciseList.contains(exercise)) {
                            userData.removeFavExercise(exercise);
                          } else {
                            userData.addFavExercise(exercise);
                          }
                        });
                      },
                      isfavorite: userData.favExerciseList.contains(exercise),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "All Equipments",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kMainBlackColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                    childAspectRatio: 10 / 7.5),
                itemCount: equipmentList.length,
                itemBuilder: (context, index) {
                  Equipment equipment = equipmentList[index];
                  return AddEquipmentCard(
                      equipmentTitle: equipment.equipmentName,
                      equipmentImageUrl: equipment.equipmentImageUrl,
                      noOfMinutes: equipment.noOfMinutes,
                      noOfCalories: equipment.noOfCalories);
                },
              )
              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: equipmentList.length,
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 1,
              //       mainAxisSpacing: kDefaultPadding,
              //       crossAxisSpacing: kDefaultPadding,
              //       childAspectRatio: 1),
              //   itemBuilder: (BuildContext context, int index) {
              //     Equipment equipment = equipmentList[index];
              //     return AddEquipmentCard(
              //       equipmentTitle: equipment.equipmentName,
              //       equipmentImageUrl: equipment.equipmentImageUrl,
              //       noOfMinutes: equipment.noOfMinutes,
              //       noOfCalories: equipment.noOfCalories);
              //   },
              // ),
            ],
          ),
        )),
      )),
    );
  }
}
