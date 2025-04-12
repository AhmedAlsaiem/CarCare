
import 'package:flutter/material.dart';
import 'package:splash_app/feature/feadback_app/presentation/views/new_feadback_body.dart';

class NewFeadback extends StatelessWidget {
  const NewFeadback({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      //appBar: customMyCarAppBar(title: 'title'),
      body: NewFeadbackBody(),
    );
  }

} 