import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';

class MecanicalViewBody extends StatelessWidget {
  const MecanicalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        color: ColorsManager.mainColor,
        child: const Center(
          child: Text(StringsManager.recomendation),
        ),
      ),
    );
  }
}
