import 'package:flutter/material.dart';

class RateTechincalStar extends StatefulWidget {
  const RateTechincalStar({super.key});

  @override
  State<RateTechincalStar> createState() => _RateTechincalStarState();
}

class _RateTechincalStarState extends State<RateTechincalStar> {
  int _rating = 0;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => _setRating(index + 1),
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            size: 40,
            color: index < _rating ? Colors.orangeAccent : Colors.grey,
          ),
        );
      }),
    );
  }
}
