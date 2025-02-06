import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/app_size.dart';

class DrawerChangeItem extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;

  const DrawerChangeItem({
    super.key,
    required this.title,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Change $title'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          TextField(
            keyboardType: keyboardType,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'New $title',
              labelStyle: const TextStyle(color: ColorsManager.balck),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorsManager.mainColor, width: 2),
              ),
            ),
          ),
          const SizedBox(height: AppSize.s10),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
            backgroundColor: ColorsManager.mainColor,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            // Handle password change logic here
            Navigator.pop(context);
          },
          child: const Text('Change'),
        ),
      ],
    );
  }
}
