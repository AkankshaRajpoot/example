import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/widgets/ThankyouWidget.dart';

class ThankyouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: "Thank you!",
      backgroundColor: kcWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacer),
        child: ThankyouWidget(
          onTap: ()  {},
        ),
      ),
    );
  }
}
