import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/indictor_home_view.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/product_horizantal.dart';

class ProductOfHorizntalAndInductor extends StatefulWidget {
  const ProductOfHorizntalAndInductor({super.key});

  @override
  State<ProductOfHorizntalAndInductor> createState() =>
      _ProductOfHorizntalAndInductorState();
}

class _ProductOfHorizntalAndInductorState
    extends State<ProductOfHorizntalAndInductor> {
  int currentIndex = 0; // Track the current index of the carousel

  final List<ProductHorizantal> items = [
   
    const ProductHorizantal(
      title: StringsManager.package,
      subTitle: StringsManager.describationOfPACKAGE,
      pathImage: AssetsManager.winsh,
      navigatePage: AppRoutes.currentLocation,
    ),
    const ProductHorizantal(
      title: StringsManager.package,
      subTitle: StringsManager.describationOfPACKAGE,
      pathImage: AssetsManager.onboarding2,
      navigatePage: AppRoutes.currentLocation,
    ),
    const ProductHorizantal(
      title: StringsManager.package,
      subTitle: StringsManager.describationOfPACKAGE,
      pathImage: AssetsManager.onboarding2,
      navigatePage: AppRoutes.currentLocation,
    ),
    const ProductHorizantal(
      title: StringsManager.package,
      subTitle: StringsManager.describationOfPACKAGE,
      pathImage: AssetsManager.onboarding2,
      navigatePage: AppRoutes.currentLocation,
    ),
    const ProductHorizantal(
      title: StringsManager.emergency,
      subTitle: StringsManager.describationOfEmergency,
      pathImage: AssetsManager.emergencyHome,
      navigatePage: AppRoutes.currentLocation,
    ),
    const ProductHorizantal(
      title: StringsManager.package,
      subTitle: StringsManager.describationOfPACKAGE,
      pathImage: AssetsManager.onboarding2,
      navigatePage: AppRoutes.currentLocation,
    ),
    const ProductHorizantal(
  
      title: StringsManager.rOODMAP,
      subTitle: StringsManager.describationOfROODMAP,
      pathImage: AssetsManager.roodMapHome,
      navigatePage: AppRoutes.currentLocation,

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.screenHeight * .17,
          child: CarouselSlider(
            items: items.map((item) => item).toList(),
            options: CarouselOptions(
              height: AppHeight.h400,
              scrollPhysics: const BouncingScrollPhysics(),
              viewportFraction: .85,
              initialPage: 0,
              padEnds: false,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  // Update the current index on page change
                  if (index == 5) {
                    index = 0;
                  }
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        SizedBox(height: AppHeight.h16),
        IndicatorHome(items: items, currentIndex: currentIndex)
      ],
    );
  }
}
