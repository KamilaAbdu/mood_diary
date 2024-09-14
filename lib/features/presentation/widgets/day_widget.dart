import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  final DateTime day;
  final bool isSelected;
  final bool isToday;
  final VoidCallback onTap;

  DayWidget({required this.day, required this.isSelected, required this.isToday, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.transparent,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              '${day.day}',
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
            if (isToday)
              Positioned(
                bottom: -6,
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
