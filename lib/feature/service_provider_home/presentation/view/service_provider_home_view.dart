import 'package:flutter/material.dart';

class ServiceProviderHomeView extends StatelessWidget {
  const ServiceProviderHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Ahmed',
        style: TextStyle(color: Colors.red),
      )),
    );
  }
}
