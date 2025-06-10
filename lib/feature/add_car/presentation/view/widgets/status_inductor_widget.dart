import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class StatusIndicatorWidget extends StatelessWidget {
  final bool isLoading;
  final bool hasResponse;
  final String status;

  const StatusIndicatorWidget({
    Key? key,
    required this.isLoading,
    required this.hasResponse,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isLoading 
          ? Colors.blue[100] 
          : (hasResponse ? Colors.green[100] : Colors.grey[100]),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(
              isLoading ? Icons.sync : 
                (hasResponse ? Icons.check_circle : Icons.error),
              color: isLoading ? Colors.blue : 
                (hasResponse ? Colors.green : Colors.red),
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(status)),
            if (isLoading) 
              const CircularProgressIndicator(color: ColorsManager.mainColor),
          ],
        ),
      ),
    );
  }
}