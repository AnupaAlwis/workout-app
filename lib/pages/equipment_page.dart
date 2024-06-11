import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_full/constants/colors.dart';
import 'package:workout_planner_full/constants/responsiveness.dart';
import 'package:workout_planner_full/models/equipment_model.dart';
import 'package:workout_planner_full/widgets/equipment_card.dart';

class EquipmentPage extends StatefulWidget {
  final String title;
  final String description;
  final List<Equipment> equipmentList;
  const EquipmentPage(
      {super.key,
      required this.title,
      required this.description,
      required this.equipmentList});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
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
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.description,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: kMainBlackColor),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                    childAspectRatio: 10/7.5),
                itemCount: widget.equipmentList.length,
                
                itemBuilder: (context, index) {
                  Equipment equipment = widget.equipmentList[index];
                  return EquipmentCard(
                      title: equipment.equipmentName,
                      iconUrlOfEquipment: equipment.equipmentImageUrl,
                      noOfCalories: equipment.noOfCalories,
                      noOfMinutes: equipment.noOfMinutes,
                      description: "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
