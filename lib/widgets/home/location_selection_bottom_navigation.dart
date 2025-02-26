import 'package:flutter/material.dart';

class LocationSelectionBottomNavigation extends StatelessWidget {
  const LocationSelectionBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: () {},
          child: Container(
            color: Colors.redAccent,
            // padding: EdgeInsets.symmetric(horizontal: sizeScreen.width * 0.41),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 62.0,
            child: Row(
              children: [
                Icon(
                  Icons.flag_circle_outlined,
                  color: Colors.white,
                  size: 36.0,
                ),
                const SizedBox(width: 12.0),
                Text(
                  "Select Country / Location",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.redAccent,
                    size: 26.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
