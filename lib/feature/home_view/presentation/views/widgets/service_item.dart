import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/font_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_entities/service_entitiy.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    required this.ontap,
    required this.service,
    super.key,
  });
  final ServiceEntitiy service;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorsManager.grey.withAlpha(90),
              borderRadius: BorderRadius.circular(AppSize.s12)),
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Image.network(
                    service.imageUrl,
                    color: ColorsManager.darkgreen,
                    height: AppSize.s64,
                    width: AppSize.s64,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppSize.s10, top: AppSize.s6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(service.title,
                            style: StylesManager.textStyleSemiBold18
                                .copyWith(color: ColorsManager.darkBlue)),
                        SizedBox(height: AppHeight.h4),
                        SizedBox(
                          width: context.screenWidth * 0.35,
                          child: Text(
                            service.subTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: FontSize.s12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
