import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/main.dart';

class VpnConnectionButton extends StatelessWidget {
  const VpnConnectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.sizeOf(context);
    final homeController = Get.find<HomeController>();
    return InkWell(
      borderRadius: BorderRadius.circular(100.0),
      onTap: () => homeController.connectionToVpnNow(),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: homeController.getVpnButtonColor.withValues(alpha: 0.1),
        ),
        child: Container(
          padding: EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: homeController.getVpnButtonColor.withValues(alpha: 0.3),
          ),
          child: Container(
            width: sizeScreen.height * 0.14,
            height: sizeScreen.height * 0.14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: homeController.getVpnButtonColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.power_settings_new,
                  size: 30.0,
                  color: Colors.white,
                ),
                const SizedBox(height: 6.0),
                Obx(
                  () => Text(
                    homeController.getVpnButtonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
