import 'package:workout_planner_full/models/equipment_model.dart';
import 'package:workout_planner_full/models/exercise_model.dart';

class User {
  final String userId;
  final String fullName;
  final String gender;
  final String address;
  final int age;
  final String description;
  int totalExercisesCompleted = 0;
  int totalEquipmentsHandOvered = 0;

  final List<Exercise> exerciseList;
  final List<Equipment> equipmentList;

  final List<Exercise> favExerciseList;
  final List<Equipment> favEquipmentList;

  User(
      {required this.totalExercisesCompleted,
      required this.totalEquipmentsHandOvered,
      required this.userId,
      required this.fullName,
      required this.gender,
      required this.address,
      required this.age,
      required this.description,
      required this.exerciseList,
      required this.equipmentList,
      required this.favExerciseList,
      required this.favEquipmentList,});

      //methods
      //Add exercise to the exercise list
      void addExercise(Exercise exercise){
        exerciseList.add(exercise);
        
      }
}

