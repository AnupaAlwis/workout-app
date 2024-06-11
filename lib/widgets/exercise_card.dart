import 'package:flutter/material.dart';
import 'package:workout_planner_full/constants/colors.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String iconUrl;
  final String description;
  const ExerciseCard({super.key, required this.title, required this.iconUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      
      decoration: BoxDecoration(
        color: kCardbgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: kMainBlackColor, spreadRadius: 1, blurRadius: 1, offset: Offset(0, 2)),
        ]
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 18,
          fontWeight: FontWeight.w400, 
          color: kMainBlackColor,
          ),
          ),
          const SizedBox(height: 10,),
          Image.asset(iconUrl, width: 100,fit: BoxFit.cover,),
          const SizedBox(height: 10,),
          Text(description, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: kMainColor),)
        ]
      ),
    );
  }
}