import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

class AccountSettingWidget extends StatelessWidget {
  const AccountSettingWidget({Key? key, required this.title, this.description, required this.onTap, required this.image}) : super(key: key);

  final String title;
  final String? description;
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Image.asset(
              "$image",
              height: 20,
              width: 20,
              color: kcDarkAlt.withOpacity(0.5),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title",
                  style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontWeight: FontWeight.w500),
                ),
                if (description != null)
                  Text(
                    "$description",
                    style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontSize: 12),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
