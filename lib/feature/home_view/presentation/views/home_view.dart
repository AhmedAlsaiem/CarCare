import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/home_view_body.dart';
import 'package:splash_app/feature/home_view/presentation/views/order_view.dart';
import 'package:splash_app/feature/my_car/my_car.dart';
import 'package:splash_app/feature/setting/setting_view.dart';
import '../manager/cubits/bottom_navigation_bar_cubit.dart';
import 'widgets/custom_home_view_botton_naviagation_bar_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: BlocBuilder<BottomNavigationIndeCubit, int>(
        builder: (context, currentIndex) {
          return PageView(
            controller: pageController,
            children: const [
              HomeViewBody(),
              MyCarsView(),
              OrdersView(),
              SettingView(),
            ],
          );
        },
      ),
      bottomNavigationBar: customBottonNavigationBar(pageController),
    );
  }
}
