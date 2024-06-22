import 'package:flutter/material.dart';
import 'package:workout_planner_full/constants/colors.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentTitle;
  final String equipmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;

  const AddEquipmentCard(
      {super.key,
      required this.equipmentTitle,
      required this.equipmentImageUrl,
      required this.noOfMinutes,
      required this.noOfCalories});

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: kSubtitleColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.equipmentTitle,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: kMainBlackColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                widget.equipmentImageUrl,
                width: 100,
                fit: BoxFit.cover,
              ),
              Text(
                "${widget.noOfMinutes} min",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kMainBlackColor),
              )
            ],
          ),
        )
      ]),
    );
  }
}
