import 'package:flutter/material.dart';

class NoVpnServerFound extends StatelessWidget {
  const NoVpnServerFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "No VPN Found, Try again",
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.black54,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
