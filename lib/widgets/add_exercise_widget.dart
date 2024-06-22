import 'package:flutter/material.dart';
import 'package:workout_planner_full/constants/colors.dart';
import 'package:workout_planner_full/constants/responsiveness.dart';
import 'package:workout_planner_full/data/user_data.dart';

class AddExerciseCard extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseImageUrl;
  final int noOfMinutes;
  final bool isAdded;
  final bool isfavorite;
  final void Function() toggleAddExercise;
  final void Function() toggleAddFavExercise;
  const AddExerciseCard(
      {super.key,
      required this.exerciseTitle,
      required this.exerciseImageUrl,
      required this.noOfMinutes,
      required this.toggleAddExercise,
      required this.isAdded,
      required this.toggleAddFavExercise,
      required this.isfavorite});

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardbgColor,
        // boxShadow: const [
        //   BoxShadow(
        //     color: kMainBlackColor,
        //     blurRadius: 10,
        //     offset: Offset(0, 2),
        //   )
        //]
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              widget.exerciseTitle,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: kMainBlackColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              widget.exerciseImageUrl,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              "${widget.noOfMinutes.toString()} Minutes",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: kSubtitleColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSubtitleColor.withOpacity(0.4),
                    ),
                    child: IconButton(
                      onPressed: () {
                        widget.toggleAddExercise();
                        print(user.exerciseList.length);
                      },
                      icon: Icon(widget.isAdded ? Icons.remove : Icons.add,
                          size: 30, color: kMainDarkBlueColor),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSubtitleColor.withOpacity(0.4),
                    ),
                    child: IconButton(
                      onPressed: () {
                        widget.toggleAddFavExercise();
                        print(user.favExerciseList.length);
                      },
                      icon: Icon(
                          widget.isfavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                          color: kMainPinkColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
