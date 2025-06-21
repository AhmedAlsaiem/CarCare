import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_my_car_app_bar.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/view/all_orders_view_body.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/view/inprogress_order_view_body.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/view/technical_home_view_body.dart';
import 'package:splash_app/feature/technical/technical_setting/presentation/views/setting_tecnical_view_body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TechnicalHomeView extends StatefulWidget {
  const TechnicalHomeView({super.key});

  @override
  State<TechnicalHomeView> createState() => _TechnicalHomeViewState();
}

class _TechnicalHomeViewState extends State<TechnicalHomeView> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  int _lastTappedIndex = -1;

  final List<GlobalKey<NavigatorState>> _tabNavigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        //padding: const EdgeInsets.only(bottom: 8, top: 8),
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        hideNavigationBarWhenKeyboardAppears: true,
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        resizeToAvoidBottomInset: true,
        handleAndroidBackButtonPress: true,
        stateManagement: false, // Important to maintain screen states
        navBarHeight: 70,
        // navBarStyle: NavBarStyle.style6,
        navBarStyle: NavBarStyle.style10,
        animationSettings: _buildAnimationSettings(),
 
        onItemSelected: (index) {
      if (_controller.index == index && _lastTappedIndex != index) {
        _tabNavigatorKeys[index].currentState?.pushReplacement(
              MaterialPageRoute(builder: (context) => _getPageForIndex(index)),
            );
      }
      _lastTappedIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [
      _buildTabScreen(
          _tabNavigatorKeys[0], const TechnicalHomeViewBody(), 'Home'),
      _buildTabScreen(
          _tabNavigatorKeys[1], const InprogressOrderViewBody(), 'Accepted'),
      _buildTabScreen(
          _tabNavigatorKeys[2], const AllOrdersViewBody(), 'All orders'),
      _buildTabScreen(
          _tabNavigatorKeys[3], const SettingTecnicalViewBody(), 'Setting'),
    ];
  }

  Widget _buildTabScreen(
      GlobalKey<NavigatorState> navigatorKey, Widget child, String title) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => _buildScreenWithAppBar(child, title),
        );
      },
    );
  }

  Widget _buildScreenWithAppBar(Widget child, String title) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: customMyCarAppBar(title: title),
      body: child,
    );
  }

  Widget _getPageForIndex(int index) {
    switch (index) {
      case 0:
        return _buildScreenWithAppBar(const TechnicalHomeViewBody(), 'Home');
      case 1:
        return _buildScreenWithAppBar(
            const InprogressOrderViewBody(), 'Accepted');
      case 2:
        return _buildScreenWithAppBar(const AllOrdersViewBody(), 'All orders');
      case 3:
        return _buildScreenWithAppBar(
            const SettingTecnicalViewBody(), 'Setting');
      default:
        return _buildScreenWithAppBar(const TechnicalHomeViewBody(), 'Home');
    }
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _buildNavItem(AssetsManager.homIcon, StringsManager.home),
      _buildNavItem(AssetsManager.accept2, StringsManager.accepted),
      _buildNavItem(AssetsManager.ordersIcon, StringsManager.yourOrders),
      _buildNavItem(AssetsManager.sttting1, StringsManager.settings),
    ];
  }

  PersistentBottomNavBarItem _buildNavItem(String assetPath, String title) {
    return PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        assetPath,
        height: 26,
        // ignore: deprecated_member_use
        color: ColorsManager.white,
      ),
      inactiveIcon: SvgPicture.asset(
        assetPath,
        height: 26,
        // ignore: deprecated_member_use
        color: ColorsManager.balck,
      ),
      title: title,
      activeColorPrimary: ColorsManager.mainColor,
      activeColorSecondary: ColorsManager.white,
      inactiveColorPrimary: Colors.grey,
    );
  }
}

// Build the navigation bar animation settings
NavBarAnimationSettings _buildAnimationSettings() {
  return const NavBarAnimationSettings(
    navBarItemAnimation: ItemAnimationSettings(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    ),
    screenTransitionAnimation: ScreenTransitionAnimationSettings(
      animateTabTransition: true,
      duration: Duration(milliseconds: 300),
      screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
    ),
  );
}
