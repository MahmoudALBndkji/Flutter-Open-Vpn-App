import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/helper/app_helper.dart';
import 'package:vpn_basic_project/helper/vpn-engine/vpn_engine.dart';
import 'package:vpn_basic_project/models/vpn_configuration_model.dart';
import 'package:vpn_basic_project/models/vpn_info_model.dart';

class HomeController extends GetxController {
  // Rx => Mean Monitor changes so that any change is identified.
  // obs => Turn anything into something observable
  // When Use [Rx] Should Use [obs]
  final Rx<VpnInfoModel> vpnInfo = AppHelper.vpnInfoObejct.obs;
  final vpnConnectionState = VpnEngine.vpnDisconnectedNow.obs;

  void connectionToVpnNow() async {
    if (vpnInfo.value.base64OpenVpnConfigurationData.isEmpty) {
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
    }
  }
}
