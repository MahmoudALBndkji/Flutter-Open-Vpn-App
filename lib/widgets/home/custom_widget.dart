import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.shape,
  });

  final String title, subTitle;
  final Widget shape;

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.sizeOf(context);
    return SizedBox(
      width: sizeScreen.width * .46,
      child: Column(
        children: [
          shape,
          SizedBox(height: 7.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 7.0),
          Text(
            subTitle.toUpperCase(),
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
