import 'package:flutter/material.dart';
import 'package:workout_planner_full/constants/colors.dart';

class AddEquipmentCard extends StatefulWidget {
  const AddEquipmentCard({super.key});

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: kSubtitleColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}