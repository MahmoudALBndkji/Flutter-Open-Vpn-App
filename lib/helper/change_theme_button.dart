import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/helper/app_helper.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.changeThemeMode(
            AppHelper.isModeDark ? ThemeMode.light : ThemeMode.dark);
        AppHelper.isModeDark = !AppHelper.isModeDark;
      },
      icon: Icon(Icons.brightness_2_outlined),
    );
  }
}
