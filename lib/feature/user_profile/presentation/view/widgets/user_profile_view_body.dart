import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/user_profile/presentation/view/widgets/custom_user_profile_buttom_section.dart';
import 'package:splash_app/feature/user_profile/presentation/view/widgets/custom_user_profile_top_section.dart';

import '../../manager/cubit/user_Profile_cubit/user_profile_cubit.dart';

class UserProfileViewBody extends StatefulWidget {
  const UserProfileViewBody({super.key});

  @override
  State<UserProfileViewBody> createState() => _UserProfileViewBodyState();
}

class _UserProfileViewBodyState extends State<UserProfileViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserProfileCubit>(context).getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomUserProfiletopSection(),
           CustomUserProfileButtomSection()
        ],
      ),
    );
  }
}
