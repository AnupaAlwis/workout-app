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
          color: kSubtitleColor.withOpacity(0.6), borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal : 8, vertical: 4),
        child: Row(
          children: [
            Image.asset(widget.imageUrl, width: 50, fit: BoxFit.cover,),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.exerciseName,
              style: const TextStyle(
                  color: kMainBlackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            IconButton(onPressed: (){
              widget.completed;
            }, 
            icon: const Icon(Icons.check_sharp), color: kMainColor,)
          ],
        ),
      ),
    );
  }
}
