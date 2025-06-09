import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart' ;
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/home_view/presentation/manager/cubits/bottom_navigation_bar_cubit.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/app_bar_home.dart' ;
import 'package:splash_app/feature/home_view/presentation/views/widgets/list_of_product_horizntal.dart';
import 'choise_servicr_text_and_icon.dart';
import 'service_home_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationIndeCubit, int>(
        builder: (context1, state) {
      return SafeArea(
        child: Container(
          color: ColorsManager.white,
          child: Column(
            children: [
              const HomeAppbar(),
              SizedBox(height: AppHeight.h6),
              const ProductOfHorizntalAndInductor(),
              SizedBox(height: AppHeight.h20),
              const ChoiseServiceTextAndIcon(),
              SizedBox(height: AppHeight.h8),
              const ServicesHomeView(),
            ],
          ),
        ),
      );
    });
  }
}
