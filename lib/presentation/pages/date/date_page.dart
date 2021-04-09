import 'package:flutter/material.dart';
import 'package:flutter_playstore/presentation/widgets/date_picker_range.dart';

class DatePage extends StatefulWidget {
  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime checkIn = DateTime.now();
  DateTime checkOut = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                _showDatePickerRangeCustom(dateRangeType: DateRangeType.START);
              },
              child: Text(checkIn.toString()),
            ),
            GestureDetector(
              onTap: () {
                _showDatePickerRangeCustom(dateRangeType: DateRangeType.RANGE);
              },
              child: Text(checkOut.toString()),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePickerRangeCustom(
      {required DateRangeType dateRangeType}) async {
    final dateResult = await showCustomDateRangePicker(
      context: context,
      firstDate: checkIn,
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: DateTimeRange(
        start: checkIn,
        end: checkIn,
      ),
      dateRangeType: dateRangeType,
    );
    setState(() {
      if (dateRangeType == DateRangeType.START) {
        checkIn = dateResult!.start;
      } else if (dateRangeType == DateRangeType.RANGE) {
        checkOut = dateResult!.end;
      }
    });
  }
}
