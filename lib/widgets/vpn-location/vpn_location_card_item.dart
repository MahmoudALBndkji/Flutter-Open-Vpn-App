import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/helper/app_helper.dart';
import 'package:vpn_basic_project/helper/format_speed_byte.dart';
import 'package:vpn_basic_project/helper/vpn-engine/vpn_engine.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/models/vpn_info_model.dart';

class VpnLocationCardItem extends StatelessWidget {
  const VpnLocationCardItem({super.key, required this.vpnInfo});
  final VpnInfoModel vpnInfo;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    sizeScreen = MediaQuery.sizeOf(context);
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: sizeScreen.height * 0.01),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: () {
          homeController.vpnInfo.value = vpnInfo;
          AppHelper.vpnInfoObejct = vpnInfo;
          Get.back();
          if (homeController.vpnConnectionState.value ==
              VpnEngine.vpnConnectedNow) {
            VpnEngine.stopVpnNow();
            Future.delayed(
              Duration(seconds: 3),
              () => homeController.connectionToVpnNow(),
            );
          } else {
            homeController.connectionToVpnNow();
          }
        },
        borderRadius: BorderRadius.circular(16.0),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          // Country Flag
          leading: Container(
            padding: EdgeInsets.all(0.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.black12),
            ),
            child: Image.asset(
              "assets/images/countryFlags/${vpnInfo.countryShortName.toLowerCase()}.png",
              height: 40.0,
              fit: BoxFit.cover,
              width: sizeScreen.width * 0.15,
            ),
          ),
          // Country Name
          title: Text(vpnInfo.countryLongName),
          // Vpn Speed
          subtitle: Row(
            children: [
              Icon(
                size: 20.0,
                Icons.shutter_speed,
                color: Colors.redAccent,
              ),
              SizedBox(width: 4.0),
              Text(
                formatSpeedByte(vpnInfo.speed, 2),
                style: TextStyle(fontSize: 13.0),
              ),
            ],
          ),
          // Number of Sessions
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                vpnInfo.vpnSessionNum.toString(),
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).lightTextColor,
                ),
              ),
              SizedBox(width: 4.0),
              Icon(
                color: Colors.redAccent,
                CupertinoIcons.person_2_alt,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
