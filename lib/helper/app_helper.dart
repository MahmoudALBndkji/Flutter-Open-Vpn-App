import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:vpn_basic_project/models/vpn_info_model.dart';

class AppHelper {
  static late Box boxOfData;
  static Future<void> initHive() async {
    await Hive.initFlutter();
    boxOfData = await Hive.openBox("data");
  }

  // Saving User Choice About Theme Selection
  static set isModeDark(bool value) => boxOfData.put('isModeDark', value);

  static bool get isModeDark => boxOfData.get('isModeDark') ?? false;

  // For Saving Single Selected VPN Details
  static VpnInfoModel get vpnInfoObejct =>
      VpnInfoModel.fromJson(boxOfData.get('vpn') ?? '{}');

  static set vpnInfoObejct(VpnInfoModel value) =>
      boxOfData.put('vpn', jsonEncode(value));

  // For Saving All VPN Servers Details
  static List<VpnInfoModel> get vpnList {
    List<VpnInfoModel> tempVpnList = [];
    final dataVpn = jsonDecode(boxOfData.get('vpnList') ?? '[]');
    for (var data in dataVpn) {
      tempVpnList.add(VpnInfoModel.fromJson(data));
    }
    return tempVpnList;
  }

  static set vpnList(List<VpnInfoModel> valueList) =>
      boxOfData.put('vpnList', jsonEncode(valueList));
}
