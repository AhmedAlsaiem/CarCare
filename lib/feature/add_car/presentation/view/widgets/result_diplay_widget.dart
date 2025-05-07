import 'package:flutter/material.dart';


class ResultsDisplayWidget extends StatelessWidget {
  final Map<String, dynamic> responseData;

  const ResultsDisplayWidget({
    Key? key,
    required this.responseData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Detection Results:',
                style:  TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Brand: ${responseData['car_brand'] ?? 'N/A'}'),
            Text('Color: ${responseData['car_color'] ?? 'N/A'}'),
            Text('Plate: ${responseData['car_plate'] ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}