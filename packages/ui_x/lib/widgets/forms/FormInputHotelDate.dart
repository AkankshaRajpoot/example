import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

import '../../helpers/TextStyl.dart';

class FormInputHotelDate extends StatelessWidget {
  FormInputHotelDate({Key? key, this.value, this.onChanged, this.firstDate, this.lastDate,  this.autoFocus, required this.heading }) : super(key: key);

  final DateTime? value;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool? autoFocus;
  final Function(dynamic)? onChanged;

  final String heading;




  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context, //context of current state
              initialDate: value ?? DateTime.now(),
              firstDate: firstDate ?? DateTime(1900),
              lastDate: lastDate ?? DateTime(2101));
          if (pickedDate != null) {
            onChanged!(pickedDate);
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          decoration: BoxDecoration(color: kcInfo.withOpacity(0.15), borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$heading",
                    style: TextStyl.bodySm?.copyWith(color: kcInfoDark, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 20,
                    color: kcDarkAlt,
                  ),
                ],
              ),
            Text(
                "${value!.year}-${value!.month < 10 ? "0" + value!.month.toString() : value!.month}-${value!.day}",
                style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}