import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DateButton extends StatefulWidget {
  const DateButton({super.key});

  @override
  State<DateButton> createState() => DateButtonState();
}

class DateButtonState extends State<DateButton> {
  int selectedIndex = 0;

  late List<DateTime> upcomingDates;

  @override
  void initState() {
    super.initState();
    upcomingDates = List.generate(7, (index) {
      return DateTime.now().add(Duration(days: index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: upcomingDates.length,
        separatorBuilder: (_, __) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          final date = upcomingDates[index];
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                color: isSelected ? Colors.teal : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${date.day}', // Day number
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('E').format(date).toLowerCase(), // short weekday
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.teal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
