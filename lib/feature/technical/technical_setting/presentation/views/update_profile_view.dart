import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/technical/technical_setting/presentation/views/update_profile_view_body.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            NavigatorManager.pushWithReplacement(
                context: context, route: AppRoutes.profileTechnicalView , );
          },
        ),
        iconTheme: const IconThemeData(color: ColorsManager.white),
        title: Text(
          'Update profile',
          style: StylesManager.textStyleBold20
              .copyWith(color: ColorsManager.white),
        ),
      ),
      body: const UpdateProfileViewBody(),
    );
  }
}
