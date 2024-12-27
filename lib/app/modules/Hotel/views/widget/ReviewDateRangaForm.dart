import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

class ReviewDateRangeForm extends StatelessWidget {
  ///
  /// Exanple:-
  ///
  /// ReviewDateRangeForm(
  ///                 startDate: DateTime(DateTime.now().year - 1, 1, 1),
  ///                 endDate: DateTime(DateTime.now().year + 1, 12, 31),
  ///                 initialRange: DateTimeRange(start: controller.selectedFromDate, end: controller.selectedToDate),
  ///                 onChanged: (DateTimeRange? dateRange) {
  ///                   if (dateRange != null) {
  ///                     controller.onSelectFromDate(dateRange.start);
  ///                     controller.onSelectToDate(dateRange.end);
  ///                   }
  ///                 },
  ///               ),
  ///
  /// Method :-
  ///
  ///  void onSelectFromDate(DateTime? start) {
  ///     _selectedFromDate(start);
  ///   }
  ///
  ///   void onSelectToDate(DateTime? end) {
  ///     _selectedToDate(end);
  ///   }
  ///
  /// Observables:-
  ///
  ///  var _selectedFromDate = DateTime.now().obs;
  ///   var _selectedToDate = DateTime.now().add(Duration(days: 1)).obs;
  ///
  /// Getters:-
  ///
  ///   DateTime get selectedFromDate => _selectedFromDate.value;
  ///   DateTime get selectedToDate => _selectedToDate.value;
  ///
  ReviewDateRangeForm({Key? key, this.onChanged, required this.startDate, required this.endDate, this.suffixIcon, this.initialRange, this.dateFormat})
      : super(key: key);

  final DateTime startDate;
  final DateTime endDate;
  final DateTimeRange? initialRange;

  final Icon? suffixIcon;
  final Function(DateTimeRange?)? onChanged;
  final String? dateFormat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTimeRange? result = await showDateRangePicker(
          context: context,
          firstDate: startDate,
          lastDate: endDate,
          initialDateRange: initialRange,
          initialEntryMode: DatePickerEntryMode.calendar,
          builder: (context, Widget? child) => Theme(
            data: ThemeData(
                appBarTheme: AppBarTheme(
                  titleSpacing: 0,
                  backgroundColor: kcPrimary,
                  centerTitle: true,
                )),
            // Theme.of(context).copyWith(
            //   appBarTheme: Theme.of(context).appBarTheme.copyWith(
            //         toolbarHeight: 75,
            //         // iconTheme: Theme.of(context).appBarTheme.iconTheme!.copyWith(color: Colors.white),
            //         iconTheme: IconThemeData(
            //           color: kcDanger,
            //           size: 25,
            //         ),
            //       ),
            // ),
            child: child!,
          ),
        );

        if (result != null) {
          onChanged!(result);
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Check-in',
                style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.w400, color: kcDarkAlt, fontSize: 13),
              ),
              SizedBox(height: 3,),
              Text(
                '${initialRange?.start.formatIt(dateFormat ?? 'dd MMM')}',
                style: TextStyl.bodySm?.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 3,),
              Text('${initialRange?.start.formatIt('h:mm a')}')
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcPrimary.withOpacity(0.1)),
            child: Text(
              "${initialRange!.end.difference(initialRange!.start).inDays} Night",
              style: TextStyl.bodySm?.copyWith(color: kcPrimary, fontSize: 10),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Check-out',
                style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.w400, color: kcDarkAlt, fontSize: 13),
              ),
              SizedBox(height: 3,),
              Text(
                '${initialRange?.end.formatIt(dateFormat ?? 'dd MMM')}',
                style: TextStyl.bodySm?.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 3,),
              Text('${initialRange?.end.formatIt('h:mm a')}')
            ],
          ),
        ],
      ),
    );
  }
}

extension DateRangeExt on DateTime {
  String formatIt(String format) {
    return Jiffy(this).format(format);
  }
}
