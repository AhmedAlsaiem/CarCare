import 'package:flutter/material.dart';
import 'package:splash_app/feature/feadback_app/presentation/views/update_view_body.dart';

class UpdateFeadback extends StatelessWidget {
  const UpdateFeadback({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(color: ColorsManager.white, size: AppSize.s30),
      //   title: Text('update your Rating' , style: StylesManager.textStyleBold24.copyWith(color: ColorsManager.white),),
      //   centerTitle:  true ,
      // ),
      body:UpdateFeadbackViewBody()
    );
  }
}
