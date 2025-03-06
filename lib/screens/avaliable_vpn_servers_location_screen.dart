import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/controllers/vpn_location_controller.dart';
import 'package:vpn_basic_project/widgets/vpn-location/loading_widget.dart';
import 'package:vpn_basic_project/widgets/vpn-location/no_vpn_server_found.dart';
import 'package:vpn_basic_project/widgets/vpn-location/vpn_avaliable_server_data.dart';

class AvaliableVpnServersLocationScreen extends StatelessWidget {
  AvaliableVpnServersLocationScreen({super.key});
  final vpnLocationController = VpnLocationController();
  @override
  Widget build(BuildContext context) {
    if (vpnLocationController.vpnFreeServerAvaliableList.isEmpty) {
      vpnLocationController.getVpnInformation();
    }
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
              "VPN Location ( ${vpnLocationController.vpnFreeServerAvaliableList.length} )"),
        ),
        body: vpnLocationController.isLoadingNewLocation.value
            ? LoadingWidget()
            : vpnLocationController.vpnFreeServerAvaliableList.isEmpty
                ? NoVpnServerFound()
                : VpnAvaliableServerData(
                    vpnLocationController: vpnLocationController,
                  ),
      ),
    );
  }
}
