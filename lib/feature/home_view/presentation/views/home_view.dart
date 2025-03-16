import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/home_view_body.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/order_view_body.dart';
import 'package:splash_app/feature/my_car/presebtation/view/my_car_view_body.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_my_car_app_bar.dart';
import 'package:splash_app/feature/setting/presentation/widgets/setting_view_body.dart';
import '../manager/cubits/bottom_navigation_bar_cubit.dart';
import 'widgets/custom_home_view_botton_naviagation_bar_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return BlocBuilder<BottomNavigationIndeCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          appBar: currentIndex != 0
              ? customMyCarAppBar(title: homeViewsTitle[currentIndex])
              : null,
          body: PageView(
            dragStartBehavior: DragStartBehavior.start,
            controller: pageController,
            children: const [
              HomeViewBody(),
              MycarViewBody(),
              OrdersViewBody(),
              SettingViewBody(),
            ],
          ),
          bottomNavigationBar:
              customBottonNavigationBar(pageController, currentIndex),
        );
      },
    );
  }
}

List<String> homeViewsTitle = [
  StringsManager.home,
  StringsManager.myCar,
  StringsManager.myOrder,
  StringsManager.settings,
];
