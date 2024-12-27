import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

import '../../../../config/Config.dart';

class MasterLayout extends StatelessWidget {
  final Widget body;
  final Widget? drawer;
  final Color? backgroundColor;
  final int? elevation;
  final dynamic title;
  final List<Widget>? actions;
  final Widget? bottomNavBar;
  final bool? centerTitle;
  final bool? debugShowCheckedModeBanner;
  final bool? resizeToAvoidBottomPadding;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? leading;
  final bool? automaticallyImplyLeading;
  final double? titleSpacing;
  final double? leadingWidth;
  final double? toolbarHeight;

  MasterLayout({
    Key? key,
    required this.body,
    this.drawer,
    this.backgroundColor,
    this.elevation,
    this.title,
    this.actions,
    this.bottomNavBar,
    this.centerTitle,
    this.debugShowCheckedModeBanner,
    this.resizeToAvoidBottomPadding,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.leading,
    this.automaticallyImplyLeading,
    this.titleSpacing,
    this.leadingWidth,
    this.toolbarHeight,
  })  : assert(title is String || title is Widget),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor ?? kcBackground,
        appBar: AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading ?? true,
          toolbarHeight: toolbarHeight ?? 56,
          elevation: 2 ,
          title: title is String
              ? Text(
                  "${title != null ? title : Config.appName}",
                )
              : title,
          actions: actions,
          centerTitle: centerTitle,
          leading: leading,
          titleSpacing: titleSpacing,

          leadingWidth: leadingWidth,

          // primary: primaryColor,
        ),
        drawer: drawer ?? null,
        body: body,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavBar,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
