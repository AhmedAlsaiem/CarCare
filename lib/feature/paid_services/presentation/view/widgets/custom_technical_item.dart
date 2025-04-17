import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/feature/paid_services/domain/enties/get_techincal_entity.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';

class CustomtechincalItem extends StatelessWidget {
  const CustomtechincalItem({super.key, required this.techincal});
  final GetTechincalEntity techincal;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSize.s12),
      height: 160,
      width: double.infinity,
      color: ColorsManager.white,
      child: Card(
        color: ColorsManager.brightGrey,
        elevation: 5,
        shadowColor: ColorsManager.white,
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s8),
          child: Row(
            children: [
              CircleAvatar(
                radius: context.screenWidth * 0.12,
                // backgroundColor: ColorsManager.white,
                backgroundImage: const AssetImage(
                  AssetsManager.userBatteries,
                ),
              ),
              SizedBox(width: context.screenWidth * 0.02),
              SizedBox(
                width: context.screenWidth * 0.325,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      techincal.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: StylesManager.textStyleRegular14.copyWith(
                        color: ColorsManager.black,
                      ),
                    ),
                    Text(
                      techincal.phoneNumber,
                      style: StylesManager.textStyleRegular14.copyWith(
                        color: ColorsManager.black,
                      ),
                    ),
                    Text(
                      '${techincal.distance.toInt()} km',
                      style: StylesManager.textStyleRegular14.copyWith(
                        color: ColorsManager.black,
                      ),
                    ),
                    const RatingBar.readOnly(
                      isHalfAllowed: true,
                      size: 24,
                      alignment: Alignment.center,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      emptyColor: ColorsManager.greenGrey,
                      filledColor: Colors.amber,
                      halfFilledIcon: Icons.star_half,
                      initialRating: 3.5,
                      maxRating: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(width: context.screenWidth * 0.05),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorsManager.mainColor,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Select',
                  style: StylesManager.textStyleRegular10.copyWith(
                    color: ColorsManager.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
