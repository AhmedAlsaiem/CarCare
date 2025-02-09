import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingAndErrorHandler extends StatelessWidget {
  final bool isLoading;
  final String errorMessage;
  final Widget child;

  const LoadingAndErrorHandler({
    super.key,
    required this.isLoading,
    required this.errorMessage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Skeletonizer(
        enabled: isLoading,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.grey[300], // Placeholder for map
              ),
            ),
            Expanded(
                flex: 1,
                child: ListView.builder(itemBuilder: (context, index) {
                  // itemCount:
                  // 3;
                  return ListTile(
                    title: Container(
                      width: double.infinity,
                      height: 16,
                      color: Colors.grey[300],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 12,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 12,
                          color: Colors.grey[300],
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                }))
          ],
        ),
      );
    } else if (errorMessage.isNotEmpty) {
      return Center(child: Text(errorMessage));
    } else {
      return child;
    }
  }
}
// import 'package:flutter/material.dart';

// class LoadingAndErrorHandler extends StatelessWidget {
//   final bool isLoading;
//   final String errorMessage;
//   final Widget child;

//   const LoadingAndErrorHandler({
//     super.key,
//     required this.isLoading,
//     required this.errorMessage,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return Center(child:CircularProgressIndicator(color: color,),)
//     } else if (errorMessage.isNotEmpty) {
//       return Center(child: Text(errorMessage));
//     } else {
//       return child;
//     }
//   }
// }
