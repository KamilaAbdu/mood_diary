import 'package:flutter/material.dart';

class WeekdayHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс']
            .map((day) => Text(day, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black)))
            .toList(),
      ),
    );
  }
}
