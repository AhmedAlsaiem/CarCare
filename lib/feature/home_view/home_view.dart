import 'package:flutter/material.dart';
import 'package:splash_app/feature/home_view/presentation/views/home_view_body.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/home_enddrawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      endDrawer: HomeEndDrawer(),
      body: HomeViewBody(),
    );
  }
}
