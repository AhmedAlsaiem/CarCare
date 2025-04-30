
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';

void showConfirmationOrderDialog({
  required BuildContext context,
  required String title,
  required String desc,
  required String snackbarText,
  required VoidCallback onConfirm,
  required VoidCallback onCancle,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.scale,
    title: title,
    desc: desc,
    btnCancelOnPress: onCancle,
    btnOkOnPress: onConfirm,
    btnCancelText: StringsManager.cancle,
    btnOkText: StringsManager.yes,
    barrierColor: Colors.grey.withAlpha(50),
    btnOkColor: ColorsManager.mainColor,
  ).show();
}
