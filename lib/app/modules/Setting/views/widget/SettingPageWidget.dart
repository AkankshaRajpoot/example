import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

class SettingPageWidget extends StatelessWidget {
  const SettingPageWidget({Key? key, required this.title, this.subTitle, this.onTap}) : super(key: key);

  final VoidCallback? onTap;
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            width: 35,
          ),
          Text(
            "$subTitle",
            style: TextStyle(fontSize: 14, color: kcDarkAlt),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
