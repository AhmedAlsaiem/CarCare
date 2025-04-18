import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/feadback_app/presentation/views/my_feadback_body.dart';

class MyFeadback extends StatelessWidget {
  const MyFeadback({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorsManager.white, size: AppSize.s30),
        title: Text('your Rating' , style: StylesManager.textStyleBold24.copyWith(color: ColorsManager.white),),
        centerTitle:  true ,
      ),
      body:const   MyFeadbackBody(),
    );
  }
}
