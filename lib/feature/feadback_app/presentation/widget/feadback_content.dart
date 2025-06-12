import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';
import 'package:splash_app/feature/feadback_app/presentation/widget/rating_bar_animation.dart';

class FeedbackContent extends StatelessWidget {
  final FeadbackEntities feadback;

  const FeedbackContent({super.key, required this.feadback});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Appwidth.w10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppHeight.h20),
            Text(
              'Your rate = ${feadback.rating}',
              style: StylesManager.textStyleBold20black,
            ),
            Text(
              'Your comment = ${feadback.comment}',
              style: StylesManager.textStyleBold20black,
            ),
            RatingsBar(
              rating: feadback.rating,
              filledColor: ColorsManager.mainColor,
              emptyColor: ColorsManager.grey,
              starSize: 40,
              animationDuration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}
