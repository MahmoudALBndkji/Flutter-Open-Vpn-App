class IpInfoModel {
  late final String countryName,
      regionName,
      cityName,
      zipCode,
      timeZone,
      internetServiceProvider,
      query;

  IpInfoModel({
    required this.countryName,
    required this.regionName,
    required this.cityName,
    required this.zipCode,
    required this.timeZone,
    required this.internetServiceProvider,
    required this.query,
  });

  factory IpInfoModel.fromJson(Map<String, dynamic> json) {
    return IpInfoModel(
      countryName: json['country'] ?? '',
      regionName: json['region'] ?? '',
      cityName: json['city'] ?? '',
      zipCode: json['zip'] ?? '',
      timeZone: json['timezone'] ?? 'Unkown',
      internetServiceProvider: json['isp'] ?? 'Unkown',
      query: json['query'] ?? 'Not Avaliable',
    );
  }
}
