import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

class PaymentOptionWidget extends StatelessWidget {
  const PaymentOptionWidget({Key? key, required this.label, required this.image, required this.onTap}) : super(key: key);
  final String label;

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Image.asset(
              "$image",
              width: 18,
              color: kcBlack,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "$label",
              style: TextStyle(color: kcBlack, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Icon(Icons.keyboard_arrow_down_outlined, size: 25),
          ],
        ),
      ),
    );
  }
}
