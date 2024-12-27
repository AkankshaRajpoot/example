import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

class FilterOptionWidget extends StatelessWidget {
  const FilterOptionWidget({Key? key, required this.label, required this.image, this.active = false, required this.onTap}) : super(key: key);

  final String label;
  final String image;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
        decoration: BoxDecoration(
          color: active ? kcInfo : kcWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: active ? kcInfo : kcDarkAlt.withOpacity(0.5)),
        ),
        child: Row(
          children: [
            if(image != "")
            Image.asset(
              '$image',
              fit: BoxFit.contain,
              height: 15,
              width: 15,
              color: active ? kcWhite : kcBlack.withOpacity(0.8),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '$label',
              style: TextStyl.bodySm?.copyWith(fontSize: 12, color: active ? kcWhite : kcBlack.withOpacity(0.8), fontWeight: FontWeight.w500),
            ),
            active
                ? Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: kcWhite,
                  )
                : Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: kcDarkAlt,
                  )
          ],
        ),
      ),
    );
  }
}
