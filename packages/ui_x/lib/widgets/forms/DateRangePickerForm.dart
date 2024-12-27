import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../ui_x.dart';

class DateRangePickerForm extends StatelessWidget {
  ///
  /// Exanple:-
  ///
  /// DateRangePickerForm(
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
  DateRangePickerForm({Key? key, this.onChanged, required this.startDate, required this.endDate, this.suffixIcon, this.initialRange, this.dateFormat})
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${initialRange?.start.formatIt(dateFormat ?? 'dd MMM')} - ${initialRange?.end.formatIt(dateFormat ?? 'dd MMM')}",
            style: TextStyle(color: kcBlack, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${initialRange!.end.difference(initialRange!.start).inDays} Night",
            style: TextStyle(color: kcBlack, fontSize: 12),
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
