import 'package:flutter/material.dart';
import 'package:splash_app/feature/home_view/presentation/pages/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: HomeViewBody(),
    );
  }
}
