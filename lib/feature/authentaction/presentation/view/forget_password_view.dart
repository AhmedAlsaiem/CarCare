import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            NavigatorManager.pop(context: context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorsManager.mainColor,
      ),
      body: ForgetPasswordBody(),
    );
  }
}
