import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(height: 100, width: 100,color: ColorsManager.mainColor,
        child:const  Center(child: Text('Messages'),),
        ),
      ),
    );
  }
}
