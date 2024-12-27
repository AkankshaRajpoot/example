import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/Sizes.dart';

import '../../../../helpers/Global.dart';

class DeletePopUpWidget extends StatelessWidget {
  const DeletePopUpWidget({Key? key,
    required this.onTapDelete,
    required this.onTapCancle,
    this.deleteLable,
    this.cancleLable,
    this.title,
    this.subtitle
  }) : super(key: key);

  final VoidCallback onTapDelete;
  final VoidCallback onTapCancle;
  final String? deleteLable;
  final String? cancleLable;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screen.height * 0.15,
      color: kcWhite,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: spacer5, vertical: spacer3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${title ?? "Delete Confirmation"}",
                style: TextStyle(color: kcBlack, fontWeight: FontWeight.w600),
              ),
              Text(
                "${subtitle ?? 'Are you sure you want to delete this address?'}",
                style: TextStyle(color: kcDarkAlt),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: onTapCancle,
                    child: Text("Cancel",
                        style: TextStyle(color: kcDarkAlt, fontWeight: FontWeight.w600)),
                  ),
                  VerticalDivider(
                    color: kcDarkAlt,
                    width: 2,
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  InkWell(
                    onTap: onTapDelete,
                    child: Text("Delete",
                        style: TextStyle(color: kcDanger, fontWeight: FontWeight.w600)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
