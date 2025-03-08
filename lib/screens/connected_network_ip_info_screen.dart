import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/api/api_vpn_gate.dart';
import 'package:vpn_basic_project/models/ip_info_model.dart';
import 'package:vpn_basic_project/models/network_ip_info_model.dart';
import 'package:vpn_basic_project/widgets/connected-network-ip-info/network_ip_info_card_item.dart';

class ConnectedNetworkIpInfoScreen extends StatelessWidget {
  const ConnectedNetworkIpInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ipInfo = IpInfoModel.fromJson({}).obs;
    ApiVpnGate.getIpDetails(ipInformation: ipInfo);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Connect Network Ip Information",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(3.0),
          children: [
            NetworkIpInfoCardItem(
              networkIpInfo: NetworkIpInfoModel(
                title: "IP Address",
                subTitle: ipInfo.value.query,
                icon: Icon(
                  Icons.my_location_outlined,
                  color: Colors.redAccent,
                ),
              ),
            ),
            NetworkIpInfoCardItem(
              networkIpInfo: NetworkIpInfoModel(
                title: "Internet Service Provider",
                subTitle: ipInfo.value.internetServiceProvider,
                icon: Icon(
                  Icons.account_tree,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            NetworkIpInfoCardItem(
              networkIpInfo: NetworkIpInfoModel(
                title: "Location",
                subTitle: ipInfo.value.countryName.isEmpty
                    ? "Retrieving..."
                    : "${ipInfo.value.cityName},${ipInfo.value.regionName},${ipInfo.value.countryName}",
                icon: Icon(
                  CupertinoIcons.location_solid,
                  color: Colors.green,
                ),
              ),
            ),
            NetworkIpInfoCardItem(
              networkIpInfo: NetworkIpInfoModel(
                title: "Zip Code",
                subTitle: ipInfo.value.zipCode,
                icon: Icon(
                  CupertinoIcons.map_pin_ellipse,
                  color: Colors.purpleAccent,
                ),
              ),
            ),
            NetworkIpInfoCardItem(
              networkIpInfo: NetworkIpInfoModel(
                title: "Time Zone",
                subTitle: ipInfo.value.timeZone,
                icon: Icon(
                  Icons.share_arrival_time_outlined,
                  color: Colors.purpleAccent,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 10.0, end: 10.0),
        child: FloatingActionButton(
          onPressed: () {
            ipInfo.value = IpInfoModel.fromJson({});
            ApiVpnGate.getIpDetails(ipInformation: ipInfo);
          },
          child: Icon(
            size: 40.0,
            color: Colors.white,
            CupertinoIcons.refresh_circled,
          ),
          shape: CircleBorder(),
          backgroundColor: Colors.redAccent,
        ),
      ),
    );
  }
}
