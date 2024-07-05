import 'package:flutter/material.dart';
import 'package:todos_app/themes/todo_typography.dart';

class TodayWidget extends StatelessWidget {
  final String dateTime;
  const TodayWidget({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Today:',
          style: TodoTypoGraphy.textBold(context),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          dateTime,
          style:
              TodoTypoGraphy.textBold(context).copyWith(color: Colors.black87),
        ),
      ],
    );
  }
}
