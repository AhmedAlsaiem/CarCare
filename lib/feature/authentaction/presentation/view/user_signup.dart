import 'package:flutter/material.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/user_sign_up_view_body.dart';

class UserSignUPView extends StatelessWidget {
  const UserSignUPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  UserSignUPViewBody(),
    );
  }
}
