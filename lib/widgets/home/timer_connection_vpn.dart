import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vpn_basic_project/helper/add_two_zero_digits.dart';

class TimerConnectionVpn extends StatefulWidget {
  const TimerConnectionVpn({super.key, required this.initTimerNow});
  final bool initTimerNow;

  @override
  State<TimerConnectionVpn> createState() => _TimerConnectionVpnState();
}

class _TimerConnectionVpnState extends State<TimerConnectionVpn> {
  Duration duration = Duration();
  Timer? timer;
  startTimerNow() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          duration = Duration(seconds: duration.inSeconds + 1);
        });
      },
    );
  }

  stopTimerNow() {
    setState(() {
      timer?.cancel();
      timer = null;
      duration = Duration();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    duration = Duration();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null || !widget.initTimerNow) {
      widget.initTimerNow ? startTimerNow() : stopTimerNow();
    }

    final hours = addTwoZeroDigits(duration.inHours.remainder(60));
    final minutes = addTwoZeroDigits(duration.inMinutes.remainder(60));
    final seconds = addTwoZeroDigits(duration.inSeconds.remainder(60));

    return Text(
      "$hours : $minutes : $seconds",
      style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
    );
  }
}
