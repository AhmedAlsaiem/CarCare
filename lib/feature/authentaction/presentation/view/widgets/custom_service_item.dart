import 'package:flutter/material.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_entities/service_entitiy.dart';

class CustomServiceItem extends StatelessWidget {
  const CustomServiceItem({
    super.key,
    required this.service,
  });
  final ServiceEntitiy service;

  @override
  Widget build(BuildContext context) {
    CacheHelper.sharedPreferences.setInt(ApiKey.serviceId, service.serviceId);
    return GestureDetector(
      onTap: () {
        NavigatorManager.pushWithReplacement(
            context: context, route: AppRoutes.serviceProviderSignUpView);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
          color: ColorsManager.grey.withAlpha(170),
        ),
        height: AppSize.s160,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    service.imageUrl,
                    height: context.screenHeight * 0.1,
                    width: context.screenHeight * 0.15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.title,
                        style: StylesManager.textStyleExtraBold24,
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.55,
                        child: Text(
                          service.subTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: StylesManager.textStyleRegular16grey
                              .copyWith(color: ColorsManager.black),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
