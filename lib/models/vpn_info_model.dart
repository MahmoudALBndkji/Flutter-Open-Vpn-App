class VpnInfoModel {
  late final String hostName,
      countryLongName,
      countryShortName,
      base64OpenVpnConfigurationData;
  late final int ip, ping, speed, vpnSessionNum;

  VpnInfoModel({
    required this.ip,
    required this.ping,
    required this.speed,
    required this.hostName,
    required this.vpnSessionNum,
    required this.countryLongName,
    required this.countryShortName,
    required this.base64OpenVpnConfigurationData,
  });

  factory VpnInfoModel.fromJson(Map<String, dynamic> json) {
    return VpnInfoModel(
      ip: json['IP'] ?? 0,
      ping: json['Ping'] ?? 0,
      speed: json['Speed'] ?? 0,
      hostName: json['HostName'] ?? " ",
      vpnSessionNum: json['NumVpnSessions'] ?? 0,
      countryLongName: json['CountryLong'] ?? " ",
      countryShortName: json['CountryShort'] ?? " ",
      base64OpenVpnConfigurationData: json['OpenVPN_ConfigData_Base64'] ?? " ",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IP': ip,
      'Ping': ping,
      'Speed': speed,
      'HostName': hostName,
      'NumVpnSessions': vpnSessionNum,
      'CountryLong': countryLongName,
      'CountryShort': countryShortName,
      'OpenVPN_ConfigData_Base64': base64OpenVpnConfigurationData,
    };
  }
}
