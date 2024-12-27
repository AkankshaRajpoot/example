import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

import '../../../helpers/Global.dart';
class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: screen.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: kcWhite, borderRadius: BorderRadius.circular(5)),
      child: widget,
    );
  }
}
