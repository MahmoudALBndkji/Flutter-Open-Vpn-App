import 'package:flutter/material.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/main.dart';

class VpnButton extends StatelessWidget {
  const VpnButton({super.key, required this.homeController});
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.sizeOf(context);
    return Semantics(
      button: true,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(18.0),
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
                  width: sizeScreen.width * 0.24,
                  height: sizeScreen.height * 0.24,
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
                      Text(
                        homeController.getVpnButtonText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
