
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/home_view/presentation/cubits/bottom_navigation_bar_cubit.dart';
import 'package:splash_app/feature/home_view/presentation/views/home_view_body.dart';
import 'package:splash_app/feature/home_view/presentation/views/messages.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/home_enddrawer.dart';
import 'package:splash_app/feature/my_car/my_car.dart';
import 'package:splash_app/feature/setting/setting_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeViewBody(),
      const MyCarsView(),
      const Messages(),
      const SettingView(),
    ];

    return Scaffold(
      endDrawer: const HomeEndDrawer(),
      body: BlocBuilder<BottomNavigationIndeCubit, int>(
        builder: (context, currentIndex) {
          return screens[currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationIndeCubit, int>(
        builder: (context, currentIndex) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<BottomNavigationIndeCubit>().updateIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.car_rental_outlined),
                label: 'My Cars',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          );
        },
      ),
    );
  }
}