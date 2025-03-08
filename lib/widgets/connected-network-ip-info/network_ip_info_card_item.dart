import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/models/network_ip_info_model.dart';

class NetworkIpInfoCardItem extends StatelessWidget {
  const NetworkIpInfoCardItem({super.key, required this.networkIpInfo});
  final NetworkIpInfoModel networkIpInfo;

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.sizeOf(context);
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.symmetric(vertical: sizeScreen.height * 0.01),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        leading: Icon(
          networkIpInfo.icon.icon,
          size: networkIpInfo.icon.size ?? 28.0,
        ),
        title: Text(networkIpInfo.title),
        subtitle: Text(networkIpInfo.subTitle),
      ),
    );
  }
}
