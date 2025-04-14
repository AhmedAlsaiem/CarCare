import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/app_size.dart';

AppBar customMyCarAppBar({required String title}) {
  return AppBar(
    leading: Container(),
    toolbarHeight: AppSize.s64,
    backgroundColor: const Color.fromARGB(255, 11, 66, 97),
    title: Text(
      
      title,
      style: const TextStyle(
        // Use direct style as test
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Use direct color
      ),
    ),
    centerTitle: true,
  );
}
