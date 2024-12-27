import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

class RulesWidget extends StatelessWidget {
  const RulesWidget({Key? key, this.rule}) : super(key: key);

  final String? rule;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2
          ),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: kcDarkGray,
              shape: BoxShape.circle
            ),
            child: Image.asset(
              'assets/icons/check.png',
              height: 8,
              color: kcWhite,

            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
              '$rule',
              style: TextStyle(
                  color: kcDarkAlt ,fontSize: 14),
            )),
      ],
    );
  }
}
