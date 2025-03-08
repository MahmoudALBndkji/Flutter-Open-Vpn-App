import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/helper/capitalize_each_word.dart';
import 'package:vpn_basic_project/helper/vpn-engine/vpn_engine.dart';
import 'package:vpn_basic_project/main.dart';

class StatusOfConnectionVPN extends StatelessWidget {
  const StatusOfConnectionVPN({super.key});

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.sizeOf(context);
    final homeController = Get.find<HomeController>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsetsDirectional.only(
        top: sizeScreen.height * 0.015,
        bottom: sizeScreen.height * 0.02,
      ),
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      child: Text(
        homeController.vpnConnectionState.value == VpnEngine.vpnDisconnectedNow
            ? "Not Connected"
            : capitalizeEachWord(
                homeController.vpnConnectionState.replaceAll("_", " "),
              ),
        style: TextStyle(fontSize: 13.0, color: Colors.white),
      ),
    );
  }
}
