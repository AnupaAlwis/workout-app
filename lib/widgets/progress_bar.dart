import 'package:flutter/material.dart';
import 'package:workout_planner_full/constants/colors.dart';

class ProgressBar extends StatefulWidget {
  final double total;
  final double progressValue;
  const ProgressBar(
      {super.key, required this.total, required this.progressValue});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    int done = (widget.progressValue * widget.total).toInt();
    return Container(
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(colors: [
          kMainColor,
          kMainDarkBlueColor,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Padding(
        padding:  const EdgeInsets.all(30.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Proteins, Fats & \nCarbohydrates",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: kMainWhiteColor,
              ),
            ),
            const SizedBox(height: 20,),
            LinearProgressIndicator(
              value: widget.progressValue,
              backgroundColor: kMainDarkBlueColor,
              minHeight: 18,
              valueColor: const AlwaysStoppedAnimation(kMainWhiteColor),
              borderRadius: BorderRadius.circular(100),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTag('Done',done.toString()),
                _buildTag('Total',widget.total.toString())
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String title, String value){
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: kMainWhiteColor,),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: kMainWhiteColor,),
        ),
      ]
    );
  }
}
