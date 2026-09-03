import 'package:flutter/material.dart';
import 'package:scoutasks/constant/app_colors.dart';

class TechnicianCalendarWidget extends StatefulWidget {
  final Function(int)? onDateSelected;

  const TechnicianCalendarWidget({super.key, this.onDateSelected});

  @override
  State<TechnicianCalendarWidget> createState() => _TechnicianCalendarWidgetState();
}

class _TechnicianCalendarWidgetState extends State<TechnicianCalendarWidget> {
  int _selectedDay = 16;
  DateTime _currentMonth = DateTime(2026, 7);

  final List<String> _monthNames = [
    'JANUARY',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER',
  ];

  void _changeMonth(int increment) {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + increment);
      int daysInNewMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
      if (_selectedDay > daysInNewMonth) {
        _selectedDay = daysInNewMonth;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.instance.surfaceLight, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _changeMonth(-1),
                child: const Icon(Icons.chevron_left, color: Colors.black54, size: 28),
              ),
              Text(
                '${_monthNames[_currentMonth.month - 1]} ${_currentMonth.year}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey.shade800),
              ),
              GestureDetector(
                onTap: () => _changeMonth(1),
                child: const Icon(Icons.chevron_right, color: Colors.black54, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
                .map(
                  (day) => Text(
                    day,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 12),
          Builder(
            builder: (context) {
              int daysInMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
              int firstDayWeekday = DateTime(_currentMonth.year, _currentMonth.month, 1).weekday;
              int emptySlots = firstDayWeekday - 1; // 1 (Mon) -> 0, 7 (Sun) -> 6

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: emptySlots + daysInMonth,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  if (index < emptySlots) {
                    return const SizedBox();
                  }

                  int day = index - emptySlots + 1;
                  bool isTask = day == 15;
                  bool isSelected = day == _selectedDay;

                  Color bgColor = Colors.white;
                  Color textColor = Colors.grey.shade600;

                  if (isTask) {
                    bgColor = AppColors.instance.primary; // Dark blue
                    textColor = Colors.white;
                  } else if (isSelected) {
                    bgColor = AppColors.instance.blue; // Bright blue
                    textColor = Colors.white;
                  }

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDay = day;
                      });
                      if (widget.onDateSelected != null) {
                        widget.onDateSelected!(day);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Text(
                        day.toString(),
                        style: TextStyle(
                          color: textColor,
                          fontSize: 13,
                          fontWeight: isTask || isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLegend(AppColors.instance.primary, 'Task'),
              _buildLegend(AppColors.instance.blue, 'Select'),
              _buildLegend(Colors.white, 'Free'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: color == Colors.white ? Border.all(color: Colors.grey.shade300) : null,
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
      ],
    );
  }
}
