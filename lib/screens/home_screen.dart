import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/controllers/home_controller.dart';
import 'package:vpn_basic_project/helper/app_helper.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/widgets/home/custom_widget.dart';
import 'package:vpn_basic_project/widgets/home/location_selection_bottom_navigation.dart';
import 'package:vpn_basic_project/widgets/home/vpn_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Free VPN"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.perm_device_info),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.changeThemeMode(
                  AppHelper.isModeDark ? ThemeMode.light : ThemeMode.dark);
              AppHelper.isModeDark = !AppHelper.isModeDark;
            },
            icon: Icon(Icons.brightness_2_outlined),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
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
                          "assets/images/countryFlags/${homeController.vpnInfo.value.countryShortName}.png"),
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
          VpnButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomWidget(
                title: "0 kbps",
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
                title: "0 kbps",
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
        ],
      ),
      bottomNavigationBar: LocationSelectionBottomNavigation(),
    );
  }
}
