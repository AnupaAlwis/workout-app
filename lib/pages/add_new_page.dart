import 'package:flutter/material.dart';
import 'package:workout_planner_full/constants/colors.dart';
import 'package:workout_planner_full/constants/responsiveness.dart';
import 'package:workout_planner_full/data/exercise_data.dart';
import 'package:workout_planner_full/data/user_data.dart';
import 'package:workout_planner_full/models/exercise_model.dart';
import 'package:workout_planner_full/widgets/add_exercise_widget.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  final userData = user;
  final exerciseList = ExerciseData().exercisesList;
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
                        noOfMinutes: exercise.noOfMinutes);
                  },
                ),
              )
            ],
          ),
        )),
      )),
    );
  }
}
