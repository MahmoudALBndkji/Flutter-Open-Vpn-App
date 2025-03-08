import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/helper/vpn-engine/vpn_engine.dart';
import 'package:vpn_basic_project/widgets/home/status_of_connection_vpn.dart';
import 'package:vpn_basic_project/widgets/home/timer_connection_vpn.dart';
import 'package:vpn_basic_project/widgets/home/vpn_connection_button.dart';

class VpnConnectionPanel extends StatelessWidget {
  const VpnConnectionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Semantics(
      button: true,
      child: Obx(
        () => Column(
          children: [
            VpnConnectionButton(),
            StatusOfConnectionVPN(),
            TimerConnectionVpn(
              initTimerNow: homeController.vpnConnectionState.value ==
                  VpnEngine.vpnConnectedNow,
            ),
          ],
        ),
      ),
    );
  }
}
