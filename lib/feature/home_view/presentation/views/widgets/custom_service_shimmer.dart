
import 'package:flutter/material.dart';

import 'custom_service_item_loading.dart';

class CustomLoadingShimmerService extends StatelessWidget {
  const CustomLoadingShimmerService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          mainAxisSpacing: 12,
          crossAxisSpacing: 2,
          childAspectRatio: 0.88, // Adjust aspect ratio as needed
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ServiceItemIndector();
        },
      ),
    );
  }
}
