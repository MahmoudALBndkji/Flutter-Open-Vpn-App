import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/helper/change_theme_button.dart';
import 'package:vpn_basic_project/helper/vpn-engine/vpn_engine.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/models/vpn_status_model.dart';
import 'package:vpn_basic_project/screens/connected_network_ip_info_screen.dart';
import 'package:vpn_basic_project/widgets/home/custom_widget.dart';
import 'package:vpn_basic_project/widgets/home/location_selection_bottom_navigation.dart';
import 'package:vpn_basic_project/widgets/home/vpn_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.sizeOf(context);
    VpnEngine.snapshotVpnStage().listen((event) {
      homeController.vpnConnectionState.value = event;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Free VPN"),
        leading: IconButton(
          onPressed: () => Get.to(() => ConnectedNetworkIpInfoScreen()),
          icon: Icon(Icons.perm_device_info),
        ),
        actions: [
          ChangeThemeButton(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomWidget(
                  title: homeController.vpnInfo.value.countryLongName.isEmpty
                      ? "Location"
                      : homeController.vpnInfo.value.countryLongName,
                  subTitle: "Free",
                  shape: CircleAvatar(
                    radius: 33.0,
                    backgroundColor: Colors.redAccent,
                    child: homeController.vpnInfo.value.countryLongName.isEmpty
                        ? Icon(
                            Icons.flag_circle,
                            size: 30.0,
                            color: Colors.white,
                          )
                        : null,
                    backgroundImage: homeController
                            .vpnInfo.value.countryLongName.isEmpty
                        ? null
                        : AssetImage(
                            "assets/images/countryFlags/${homeController.vpnInfo.value.countryShortName.toLowerCase()}.png"),
                  ),
                ),
                CustomWidget(
                  title: homeController.vpnInfo.value.countryLongName.isEmpty
                      ? "60 ms"
                      : "${homeController.vpnInfo.value.ping} ms",
                  subTitle: "Ping",
                  shape: CircleAvatar(
                    radius: 33.0,
                    backgroundColor: Colors.black54,
                    child: Icon(
                      Icons.graphic_eq,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          VpnButton(),
          StreamBuilder<VpnStatusModel?>(
            initialData: VpnStatusModel(),
            stream: VpnEngine.snapshotVpnStatus(),
            builder: (context, snapshot) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomWidget(
                  title: snapshot.data?.byteIn ?? "0 kbps",
                  subTitle: "Download",
                  shape: CircleAvatar(
                    radius: 33.0,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.arrow_circle_down,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                CustomWidget(
                  title: snapshot.data?.byteOut ?? "0 kbps",
                  subTitle: "Upload",
                  shape: CircleAvatar(
                    radius: 33.0,
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(
                      Icons.arrow_circle_up,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: LocationSelectionBottomNavigation(),
    );
  }
}
