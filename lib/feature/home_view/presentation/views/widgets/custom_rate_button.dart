import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class CustomRateButton extends StatelessWidget {
  const CustomRateButton({super.key});

  void _showRatingDialog(BuildContext context) {
    double _rating = 3.0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'Rate Technical',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RatingBar.builder(
                    initialRating: _rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 40,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Rate: ${_rating.toStringAsFixed(1)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancle',
                style: StylesManager.textStyleRegular14
                    .copyWith(color: ColorsManager.mainColor),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.babyBlue),
              child: Text(
                'Send',
                style: StylesManager.textStyleRegular14
                    .copyWith(color: ColorsManager.mainColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showRatingDialog(context),
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        backgroundColor: const WidgetStatePropertyAll(
          ColorsManager.blueGrey, // استبدلها بـ ColorsManager.mainColor لو بتحب
        ),
      ),
      child: const Text(
        'Rate',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: ColorsManager.white,
        ),
      ),
    );
  }
}
