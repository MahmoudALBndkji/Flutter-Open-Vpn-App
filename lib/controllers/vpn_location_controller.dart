import 'package:get/get.dart';
import 'package:vpn_basic_project/api/api_vpn_gate.dart';
import 'package:vpn_basic_project/helper/app_helper.dart';
import 'package:vpn_basic_project/models/vpn_info_model.dart';

class VpnLocationController extends GetxController {
  List<VpnInfoModel> vpnFreeServerAvaliableList = AppHelper.vpnList;
  final RxBool isLoadingNewLocation = false.obs;
  Future<void> getVpnInformation() async {
    isLoadingNewLocation.value = true;
    vpnFreeServerAvaliableList.clear();
    vpnFreeServerAvaliableList =
        await ApiVpnGate.getAllAvailableFreeVpnServers();
    isLoadingNewLocation.value = false;
  }
}
