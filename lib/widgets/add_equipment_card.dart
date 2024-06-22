import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workout_planner_full/constants/colors.dart';
import 'package:workout_planner_full/data/user_data.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentTitle;
  final String equipmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;
  final void Function() toggleAddEquipment;
  final void Function() toggleAddFavEquipment;
  final bool isAdded;
  final bool isfavorite;

  const AddEquipmentCard(
      {super.key,
      required this.equipmentTitle,
      required this.equipmentImageUrl,
      required this.noOfMinutes,
      required this.noOfCalories,
      required this.toggleAddEquipment,
      required this.toggleAddFavEquipment,
      required this.isAdded,
      required this.isfavorite});

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "${widget.noOfMinutes} minutes of workout",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kMainColor),
                    ),
                    Text(
                      "${widget.noOfCalories} calories will burn",
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: kMainColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              widget.toggleAddEquipment();
                              print(user.equipmentList.length);
                            },
                            icon: Icon(widget.isAdded? Icons.remove_circle : Icons.add_circle,
                                color: kMainColor, size: 25)),
                        const SizedBox(
                          width: 30,
                        ),
                        IconButton(
                            onPressed: () {
                              widget.toggleAddFavEquipment();
                              print(user.favEquipmentList.length);
                            },
                            icon: Icon(widget.isfavorite? Icons.favorite : Icons.favorite_border,
                                color: kMainPinkColor, size: 25))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
