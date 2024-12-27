import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../helpers/Global.dart';

class ResponsiveUi extends StatelessWidget {
  const ResponsiveUi(
      {Key? key, this.desktop, this.tablet, required this.mobile, this.watch})
      : super(key: key);

  final Widget? desktop;
  final Widget? tablet;
  final Widget mobile;
  final Widget? watch;


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        /// Desktop
        if(desktop != null)
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop
          ) {
            log.w("desktop");
            return desktop!;
          }

        /// Tablet
        if(tablet != null)
          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet
          ) {
            log.w("tablet");
            return tablet!;
          }

        /// Mobile
        if(mobile != null)
          if (sizingInformation.deviceScreenType == DeviceScreenType.mobile
          ) {
            // log.w("mobile");
            if (screenWidth <= 470) {
              log.w("mobile");
              return mobile;
            } else {
              log.w("tablet");
              return tablet!;
            }

          }

        /// Watch
        if(watch != null)
          if (sizingInformation.deviceScreenType == DeviceScreenType.watch
          ) {
            log.w("watch");
            return watch!;
          }

        /// Return
        return tablet!;
      },
    );
  }
}
