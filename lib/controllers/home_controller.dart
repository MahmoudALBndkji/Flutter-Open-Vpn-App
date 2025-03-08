import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/helper/app_helper.dart';
import 'package:vpn_basic_project/helper/vpn-engine/vpn_engine.dart';
import 'package:vpn_basic_project/models/vpn_configuration_model.dart';
import 'package:vpn_basic_project/models/vpn_info_model.dart';
import 'package:vpn_basic_project/screens/avaliable_vpn_servers_location_screen.dart';

class HomeController extends GetxController {
  // Rx => Mean Monitor changes so that any change is identified.
  // obs => Turn anything into something observable
  // When Use [Rx] Should Use [obs]
  final Rx<VpnInfoModel> vpnInfo = AppHelper.vpnInfoObejct.obs;
  final vpnConnectionState = VpnEngine.vpnDisconnectedNow.obs;

  void connectionToVpnNow() async {
    if (vpnInfo.value.base64OpenVpnConfigurationData.isEmpty) {
      Get.to(() => AvaliableVpnServersLocationScreen());
      Get.snackbar(
          "Country / Location", "Please Select Country / Location First");
      return;
    }
    // Disconnected
    if (vpnConnectionState.value == VpnEngine.vpnDisconnectedNow) {
      final dataConfigVpn =
          Base64Decoder().convert(vpnInfo.value.base64OpenVpnConfigurationData);
      final configuration = Utf8Decoder().convert(dataConfigVpn);
      final vpnConfiguration = VpnConfigurationModel(
        username: "vpn",
        password: "vpn",
        countryName: vpnInfo.value.countryLongName,
        config: configuration,
      );
      await VpnEngine.startVpnNow(vpnConfiguration);
    } else {
      await VpnEngine.stopVpnNow();
    }
  }

  Color get getVpnButtonColor {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnectedNow:
        return Colors.redAccent;
      case VpnEngine.vpnConnectedNow:
        return Colors.green;
      default:
        return Colors.orangeAccent;
    }
  }

  String get getVpnButtonText {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnectedNow:
        return "Let's Connect";
      case VpnEngine.vpnConnectedNow:
        return "Disconnected";
      default:
        return "Connection...";
    }
  }
}
