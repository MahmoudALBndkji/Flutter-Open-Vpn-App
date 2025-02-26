import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';

class VpnButton extends StatelessWidget {
  const VpnButton({super.key});

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.sizeOf(context);
    return Semantics(
      button: true,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent[100],
              ),
              child: Container(
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent[200],
                ),
                child: Container(
                  width: sizeScreen.width * 0.24,
                  height: sizeScreen.height * 0.24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent[400],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.power_settings_new,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        "Let's Connect",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
