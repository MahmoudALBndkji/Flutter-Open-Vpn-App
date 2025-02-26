import 'package:get/get.dart';
import 'package:vpn_basic_project/helper/app_helper.dart';
import 'package:vpn_basic_project/models/vpn_info_model.dart';

class HomeController extends GetxController {
  // Rx => Mean Monitor changes so that any change is identified.
  // obs => Turn anything into something observable
  // When Use [Rx] Should Use [obs]
  final Rx<VpnInfoModel> vpnInfo = AppHelper.vpnInfoObejct.obs;
}
