import 'package:flutter/material.dart';
import 'package:vpn_basic_project/controllers/vpn_location_controller.dart';
import 'package:vpn_basic_project/widgets/vpn-location/vpn_location_card_item.dart';

class VpnAvaliableServerData extends StatelessWidget {
  const VpnAvaliableServerData(
      {super.key, required this.vpnLocationController});
  final VpnLocationController vpnLocationController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(3.0),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => VpnLocationCardItem(
        vpnInfo: vpnLocationController.vpnFreeServerAvaliableList[index],
      ),
      itemCount: vpnLocationController.vpnFreeServerAvaliableList.length,
    );
  }
}
