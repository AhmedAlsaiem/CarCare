import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class FilterDropdown extends StatelessWidget {
  final String selectedFilter;
  final List<String> filterOptions;
  final ValueChanged<String> onChanged;

  const FilterDropdown({
    super.key,
    required this.selectedFilter,
    required this.filterOptions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: ColorsManager.mainColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: ColorsManager.mainColor,
          value: selectedFilter,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          onChanged: (String? newValue) {
            if (newValue != null) onChanged(newValue);
          },
          items: filterOptions.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
