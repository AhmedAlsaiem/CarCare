import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/user_profile/presentation/view/widgets/user_profile_view_body.dart';

import 'widgets/custom_profile_appbar.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: customProfileAppBar(context),
      body: const UserProfileViewBody(),
    );
  }
}
