import 'package:flutter/material.dart';
import 'package:workout_planner_full/constants/colors.dart';

class FavoriteCard extends StatefulWidget {
  final String imageUrl;
  final String exerciseName;
  final void Function() completed;
  const FavoriteCard(
      {super.key,
      required this.imageUrl,
      required this.exerciseName,
      required this.completed});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: kSubtitleColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset(widget.imageUrl),
          Text(
            widget.exerciseName,
            style: const TextStyle(
                color: kMainBlackColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          IconButton(onPressed: (){
            widget.completed;
          }, icon: Icon(Icons.play_arrow_outlined))
        ],
      ),
    );
  }
}
