import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vpn_basic_project/models/vpn_configuration_model.dart';
import 'package:vpn_basic_project/models/vpn_status_model.dart';

class VpnEngine {
  // Native Channel
  static final String eventChannelVpnStage = "vpnStage";
  static final String eventChannelVpnStatus = "vpnStatus";
  static final String methodChannelVpnControl = "vpnControl";

  // VPN Connection Stage SnapShot
  static Stream<String> snapshotVpnStage() =>
      EventChannel(eventChannelVpnStage).receiveBroadcastStream().cast();

  // VPN Connection Status SnapShot
  static Stream<VpnStatusModel?> snapshotVpnStatus() =>
      EventChannel(eventChannelVpnStatus)
          .receiveBroadcastStream()
          .map(
              (eventStatus) => VpnStatusModel.fromJson(jsonDecode(eventStatus)))
          .cast();

  // Start VPN Now
  static Future<void> startVpnNow(
      VpnConfigurationModel vpnConfiguration) async {
    return MethodChannel(methodChannelVpnControl).invokeMethod(
      "start",
      {
        "config": vpnConfiguration.config,
        "country": vpnConfiguration.countryName,
        "username": vpnConfiguration.username,
        "password": vpnConfiguration.password,
      },
    );
  }

  // Stop VPN
  static Future<void> stopVpnNow() async {
    return MethodChannel(methodChannelVpnControl).invokeMethod("stop");
  }

  // Kill VPN
  static Future<void> killSwitchOpenNow() async {
    return MethodChannel(methodChannelVpnControl).invokeMethod("kill_switch");
  }

  // Refresh VPN
  static Future<void> refreshStageNow() async {
    return MethodChannel(methodChannelVpnControl).invokeMethod("refresh");
  }

  // Stage VPN
  static Future<String?> getStageNow() async {
    return MethodChannel(methodChannelVpnControl).invokeMethod("stage");
  }

  // Check Is Connected VPN
  static Future<bool> isConnectedNow() async {
    return getStageNow().then((value) => value?.toLowerCase() == "connected");
  }

  // Stage Of VPN Connection
  static const String vpnConnectedNow = "connected";
  static const String vpnDisconnectedNow = "disconnected";
  static const String vpnWaitconnectionNow = "wait_connection";
  static const String vpnAuthenticationNow = "authenticating";
  static const String vpnReconnectNow = "reconnect";
  static const String vpnNoConnectionNow = "no_connection";
  static const String vpnConnectingNow = "connecting";
  static const String vpnPrepareNow = "prepare";
  static const String vpnDeniedNow = "denied";
}
