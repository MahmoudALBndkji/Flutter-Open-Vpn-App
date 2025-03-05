import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/helper/app_helper.dart';
import 'package:vpn_basic_project/models/ip_info_model.dart';
import 'package:vpn_basic_project/models/vpn_info_model.dart';
import 'package:http/http.dart' as http;

class ApiVpnGate {
  static Future<List<VpnInfoModel>> getAllAvailableFreeVpnServers() async {
    final List<VpnInfoModel> vpnServerList = [];
    try {
      final response =
          await http.get(Uri.parse('https://www.vpngate.net/api/iphone/'));
      final commaSeperatedValueString =
          response.body.split("#")[1].replaceAll("*", "");
      List<List<dynamic>> listData =
          const CsvToListConverter().convert(commaSeperatedValueString);
      final header = listData[0];
      for (int counter = 1; counter < listData.length - 1; counter++) {
        Map<String, dynamic> jsonData = {};
        for (int innerCounter = 0;
            innerCounter < header.length - 1;
            innerCounter++) {
          jsonData.addAll({
            header[innerCounter].toString(): listData[counter][innerCounter]
          });
        }
        vpnServerList.add(VpnInfoModel.fromJson(jsonData));
      }
    } catch (error) {
      Get.snackbar(
        "Error Message",
        error.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent.withValues(alpha: 0.8),
      );
    }
    vpnServerList.shuffle();
    if (vpnServerList.isNotEmpty) AppHelper.vpnList = vpnServerList;
    return vpnServerList;
  }

  static Future<void> getIpDetails({
    required Rx<IpInfoModel> ipInformation,
  }) async {
    try {
      final response = await http.get(Uri.parse("http://ip-api.com/json/"));
      final jsonData = jsonDecode(response.body);
      ipInformation.value = IpInfoModel.fromJson(jsonData);
    } catch (error) {
      Get.snackbar(
        "Error Message",
        error.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent.withValues(alpha: 0.8),
      );
    }
  }
}
