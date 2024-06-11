import 'package:flutter/material.dart';
import 'package:workout_planner_full/constants/colors.dart';

class EquipmentCard extends StatelessWidget {
  final String title;
  final String iconUrlOfEquipment;
  final double noOfCalories;
  final int noOfMinutes;
  final String description;

  const EquipmentCard(
      {super.key,
      required this.title,
      required this.iconUrlOfEquipment,
      required this.noOfCalories,
      required this.noOfMinutes,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final String subtitle = "$noOfMinutes minutes of Workout \n$noOfCalories Calories will burn";
    
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: kMainBlackColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
          color: kCardbgColor),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: kMainBlackColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    iconUrlOfEquipment,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kMainColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: kSubtitleColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
