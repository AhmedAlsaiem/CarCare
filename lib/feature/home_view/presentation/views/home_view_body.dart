import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';

import 'package:splash_app/feature/home_view/presentation/widgets/app_bar_home.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/choise_servicr_text_and_icon.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/list_of_product_horizntal.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/service_home_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  

  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Column(
        children: [
          const AppbarHome(),
        
          SizedBox(height: AppHeight.h6),
          const ProductOfHorizntalAndInductor(),
          SizedBox(
            height: AppHeight.h20,
          ),
          const ChoiseServiceTextAndIcon(),
          SizedBox(height: AppHeight.h8,),
        const   ServicesHomeView(),
          //   ServiceItem(),
        ],
      ),
    );
  }
}

