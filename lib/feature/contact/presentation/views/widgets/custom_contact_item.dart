import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart' show StylesManager;
import 'package:splash_app/feature/contact/domain/entities/contact_entity.dart';
import 'package:splash_app/feature/user_profile/presentation/view/widgets/custom_svg_icon.dart';

import '../../../../../core/utils/color_manager.dart';

class CustomContactItem extends StatelessWidget {
  const CustomContactItem({
    super.key,
    required this.contactItem,
  });
  final ContactEntity contactItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: context.screenHeight * 0.17,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorsManager.white, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: 10,
              child: Text(
                contactItem.lastModifiy.substring(0, 10),
                style: StylesManager.textStyleRegular14
                    .copyWith(color: ColorsManager.black),
              ),
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: AppSize.s30,
                  backgroundColor: ColorsManager.babyBlue,
                  child: CustomSvgIcon(
                    imagePath: AssetsManager.messageIcon,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      contactItem.fullName,
                      style: StylesManager.textStyleMedium16
                          .copyWith(color: ColorsManager.black),
                    ),
                    const SizedBox(height: AppSize.s08),
                    SizedBox(
                      width: context.screenWidth * 0.65,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        contactItem.message,
                        style: StylesManager.textStyleRegular14
                            .copyWith(color: ColorsManager.black),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
