class VpnStatusModel {
  String? byteIn, byteOut, durationTime, lastPackageReceive;

  VpnStatusModel({
    this.byteIn,
    this.byteOut,
    this.durationTime,
    this.lastPackageReceive,
  });

  factory VpnStatusModel.fromJson(Map<String, dynamic> json) {
    return VpnStatusModel(
      byteIn: json['byte_in'],
      byteOut: json['byte_out'],
      durationTime: json['duration'],
      lastPackageReceive: json['last_packet_receive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'byte_in': byteIn,
      'byte_out': byteOut,
      'duration': durationTime,
      'last_packet_receive': lastPackageReceive,
    };
  }
}
