import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_full/constants/colors.dart';
import 'package:workout_planner_full/constants/responsiveness.dart';
import 'package:workout_planner_full/models/exercise_model.dart';
import 'package:workout_planner_full/widgets/exercise_card.dart';

class ExercisePage extends StatefulWidget {
  final String title;
  final String description;
  final List<Exercise> exerciseList;

  const ExercisePage(
      {super.key,
      required this.title,
      required this.description,
      required this.exerciseList});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  //Date formatters
  final DateFormat formatter = DateFormat("EEEE , MMMM ");
  final DateFormat dayFormat = DateFormat("dd");
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now(); // get today's date
    String formattedDate = formatter.format(now); // format the date
    String formatterDate = dayFormat.format(now);
    return Scaffold(
      appBar: AppBar(
          title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$formattedDate  $formatterDate",
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kSubtitleColor),
          ),
          Text(
            widget.title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: kMainBlackColor),
          )
        ],
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(children: [
            Text(
              widget.description,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: kMainBlackColor),
            ),
            const SizedBox(height: 20,),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  childAspectRatio: 1
                ),
                itemCount: widget.exerciseList.length,
                itemBuilder: (context, index) {
                  Exercise exercise = widget.exerciseList[index];
                  return ExerciseCard(
                    title: exercise.exerciseName,
                    iconUrl: exercise.exerciseImageUrl,
                    description: "${exercise.noOfMinutes} of Workout",
                  );
                })
          ]),
        ),
      ),
    );
  }
}
