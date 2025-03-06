import 'dart:math';

String formatSpeedByte(int speedByte, int decimals) {
  if (speedByte <= 0) return "0 B";
  const suffixesTitle = ["Bps", "Kbps", "Mps", "Gps", "Tbps"];
  var speedTitleIndex = ((log(speedByte) / log(1024))).floor(); // 0 1 2 3 4
  return "${(speedByte / pow(1024, speedTitleIndex)).toStringAsFixed(decimals)} ${suffixesTitle[speedTitleIndex]}";
}
