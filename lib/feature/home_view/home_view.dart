import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/home_view/presentation/cubits/bottom_navigation_bar_cubit.dart';
import 'package:splash_app/feature/home_view/presentation/views/home_view_body.dart';
import 'package:splash_app/feature/home_view/presentation/views/messages.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/home_enddrawer.dart';
import 'package:splash_app/feature/my_car/my_car.dart';
import 'package:splash_app/feature/setting/setting_view.dart';

class ZommDrawerCalss extends StatelessWidget {
  const ZommDrawerCalss({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: ColorsManager.mainColor,
      style: DrawerStyle.defaultStyle,
      menuScreen: const HomeEndDrawer(),
      mainScreen: const HomeView(),
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      slideWidth: MediaQuery.of(context).size.width * 0.85,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      isRtl: true,
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorsManager.darkgreen,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    final List<Widget> screens = [
      const HomeViewBody(),
      const MyCarsView(),
      const Messages(),
      const SettingView(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<BottomNavigationIndeCubit, int>(
        builder: (context, currentIndex) {
          return screens[currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationIndeCubit, int>(
        builder: (context, currentIndex) {
          return SizedBox(
            width: double.maxFinite,
            child: CurvedNavigationBar(
              index: currentIndex,
              height: 60,
              items: const <Widget>[
                Icon(Icons.home, size: AppSize.s30, color: ColorsManager.white),
                Icon(Icons.car_rental_outlined,
                    size: AppSize.s30, color: ColorsManager.white),
                Icon(Icons.message,
                    size: AppSize.s30, color: ColorsManager.white),
                Icon(Icons.settings,
                    size: AppSize.s30, color: ColorsManager.white),
              ],
              color: ColorsManager.darkgreen,
              buttonBackgroundColor: ColorsManager.darkgreen,
              backgroundColor: ColorsManager.white,
              animationCurve: Curves.easeInQuint,
              animationDuration: const Duration(milliseconds: 200),
              onTap: (index) {
                context.read<BottomNavigationIndeCubit>().updateIndex(index);
              },
              letIndexChange: (index) => true,
            ),
          );
        },
      ),
    );
  }
}
