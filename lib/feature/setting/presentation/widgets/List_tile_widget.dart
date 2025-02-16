
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class ListTileWidget extends StatelessWidget {
const    ListTileWidget({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Card(
           margin: const EdgeInsets.only(left: 8 , right: 8  , bottom: 16),
          color: Colors.grey[320],
          
          elevation: 5,
        child: Center(
          child: ListTile(
            leading: Icon(
             icon,
              size: 30,
              color: ColorsManager.mainColor,
            ),
            
            title: Text(
              title,
              style: StylesManager.textStyleBold20.copyWith(color: ColorsManager.mainColor),
            ),
            onTap:onTap, 
          ),
        ),
      ),
    );
  }
}
