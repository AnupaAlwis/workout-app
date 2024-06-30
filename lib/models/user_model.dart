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

      //Remove a exercise from the exercise list
      void removeExercise(Exercise exercise){
        exerciseList.remove(exercise);
      }

      //Add a exercise to the favorite list
      void addFavExercise(Exercise exercise){
        favExerciseList.add(exercise);
      }

      //Remove a exercise from the favorite list
      void removeFavExercise(Exercise exercise){
        favExerciseList.remove(exercise);
      }

      //Add an equipment to the equipment list
      void addEquipment(Equipment equipment){
        equipmentList.add(equipment);
      } 

      //Remove an equipment from the equipment list
      void removeEquioment(Equipment equipment){
        equipmentList.remove(equipment);
      }

      //Add a equipment to the favorite list
      void addFavEquipment(Equipment equipment){
        favEquipmentList.add(equipment);
      }

      //Remove a equipment from the favorite list
      void removeFavEquipment(Equipment equipment){
        favEquipmentList.remove(equipment);
      }

      //Calculate total number of minutes spend
      int totalNumberOfMinutedSpend(){
        int totalNumberOfMinutes = 0;
        for (var exercise in exerciseList){
          totalNumberOfMinutes += exercise.noOfMinutes;
        }
        for (var equipment in equipmentList){
          totalNumberOfMinutes += equipment.noOfMinutes;
        }

        return totalNumberOfMinutes;

      }


}

