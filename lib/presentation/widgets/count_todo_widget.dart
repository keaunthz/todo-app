import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todos_app/constants/image_assets.dart';

import '../../themes/todo_colors.dart';
import '../../themes/todo_typography.dart';

class CountTodoWidget extends StatelessWidget {
  final String numOfTasks;
  final double percentDoneCount;
  final String percentIsDone;
  final bool isDoneAllTask;
  const CountTodoWidget(
      {super.key,
      required this.numOfTasks,
      required this.percentDoneCount,
      required this.percentIsDone,
      required this.isDoneAllTask});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(ImageAssets.toDoImg, width: 20, height: 20),
            const SizedBox(
              width: 10,
            ),
            Text(
              '$numOfTasks Tasks',
              style: TodoTypoGraphy.textBold(context),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: LinearPercentIndicator(
            width: 200,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            barRadius: const Radius.circular(10),
            lineHeight: 3.5,
            percent: percentDoneCount,
            backgroundColor: TodoColors.primary.shade200.withOpacity(0.5),
            progressColor: Colors.green,
          ),
        ),
        Row(
          children: [
            Text(
              '$percentIsDone % Done',
              style: TodoTypoGraphy.textsmall(context)
                  .copyWith(color: TodoColors.primary.shade500),
            ),
            const SizedBox(
              width: 20,
            ),
            Visibility(
              visible: isDoneAllTask,
              child: Text(
                'Good Job!',
                style: TodoTypoGraphy.textsmall(context)
                    .copyWith(color: TodoColors.primary.shade500),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
