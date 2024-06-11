import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_full/constants/colors.dart';
import 'package:workout_planner_full/constants/responsiveness.dart';
import 'package:workout_planner_full/data/equipment_data.dart';
import 'package:workout_planner_full/data/exercise_data.dart';
import 'package:workout_planner_full/data/user_data.dart';
import 'package:workout_planner_full/pages/equipment_page.dart';
import 'package:workout_planner_full/pages/exercise_page.dart';
import 'package:workout_planner_full/widgets/exercise_card.dart';
import 'package:workout_planner_full/widgets/progress_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                height: 30,
              ),
              const ProgressBar(total: 100, progressValue: 0.1),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Today's Activity",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: kMainBlackColor),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExercisePage(
                              title: "Warm Up",
                              description:
                                  "Warmup is a method of preparing the body for exercise or sports by increasing the heart rate and warming the muscles. It is a simple exercise that helps to increase the blood flow to the muscles and prepare them for physical activity.",
                              exerciseList: exerciseList),
                        ),
                      );
                    },
                    child: const ExerciseCard(
                        title: "Warm Up",
                        iconUrl: "assets/images/exercises/cobra.png",
                        description: "See more..."),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EquipmentPage(
                                  title: "Equipment",
                                  description:
                                      "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                  equipmentList: equipmentsList)));
                    },
                    child: const ExerciseCard(
                        title: "Equipments",
                        iconUrl: "assets/images/exercises/hunch_back.png",
                        description: "See more..."),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExercisePage(
                                  title: "Exercise",
                                  description:
                                      "Exercise is a method of preparing the body for exercise or sports by increasing the heart rate and warming the muscles. It is a simple exercise that helps to increase the blood flow to the muscles and prepare them for physical activity.",
                                  exerciseList: exerciseList)));
                    },
                    child: const ExerciseCard(
                        title: "Exercise",
                        iconUrl: "assets/images/exercises/weightlifting.png",
                        description: "See more..."),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ExercisePage(
                            title: "Streching",
                            description:
                                "Streching is a method of preparing the body for exercise or sports by increasing the heart rate and warming the muscles. It is a simple exercise that helps to increase the blood flow to the muscles and prepare them for physical activity.",
                            exerciseList: exerciseList);
                      }));
                    },
                    child: const ExerciseCard(
                        title: "Stretching",
                        iconUrl: "assets/images/exercises/yoga.png",
                        description: "See more..."),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
