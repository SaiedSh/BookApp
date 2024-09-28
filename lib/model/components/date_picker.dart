import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final String lable;
  final double? width;
  final double? height;
  final String selectedDate;

  // DateTime selectedDatee = DateTime.now();
  final Function()? onTap;
  DatePicker({
    super.key,
    required this.lable,
    this.onTap,
    this.width,
    this.height,
    required this.selectedDate,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: widget.height ?? 40,
        child: InputDecorator(
          child: Text(
            "${widget.selectedDate}",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('lib/assets/images/birth.png'),
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingLabelAlignment: FloatingLabelAlignment.center,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey, width: 1)),
              fillColor: Colors.white,
              filled: true),
          // child: Center(
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 3),
          //     child: Text(
          //       "${widget.selectedDate}",
          //       style:
          //           TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}

// class ShamsiDatePickerDemo extends StatefulWidget {
//   @override
//   _ShamsiDatePickerDemoState createState() => _ShamsiDatePickerDemoState();
// }

// class _ShamsiDatePickerDemoState extends State<ShamsiDatePickerDemo> {
//   Jalali? _selectedDate;

//   Future<void> _selectDate(BuildContext context) async {
//     final Jalali? picked = await showDialog<Jalali>(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           child: CalendarDatePicker2(
//             initialDate: Jalali.now(),
//             firstDate: Jalali(1300, 1, 1),
//             lastDate: Jalali(1450, 12, 29),
//           ),
//         );
//       },
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           _selectedDate == null
//               ? 'No date selected'
//               : 'Selected Shamsi Date: ${_selectedDate!.year}/${_selectedDate!.month}/${_selectedDate!.day}',
//         ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () => _selectDate(context),
//           child: Text('Select Shamsi Date'),
//         ),
//       ],
//     );
//   }
// }

// class CalendarDatePicker2 extends StatelessWidget {
//   final Jalali initialDate;
//   final Jalali firstDate;
//   final Jalali lastDate;

//   const CalendarDatePicker2({
//     Key? key,
//     required this.initialDate,
//     required this.firstDate,
//     required this.lastDate,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CalendarDatePicker(
//       initialDate: initialDate.toGregorian().toDateTime(),
//       firstDate: firstDate.toDateTime(),
//       lastDate: lastDate.toDateTime(),
//       onDateChanged: (DateTime date) {
//         Navigator.of(context).pop(Jalali.fromDateTime(date));
//       },
//     );
//   }
// }

// class PersianDatePickerExample extends StatefulWidget {
//   @override
//   _PersianDatePickerExampleState createState() =>
//       _PersianDatePickerExampleState();
// }

// class _PersianDatePickerExampleState extends State<PersianDatePickerExample> {
//   String _selectedDate = 'Select Date';
//   // Jalali? _selectedDate;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             '$_selectedDate',
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _showPersianDatePicker,
//             child: Text('Pick a Date'),
//           ),
//         ],
//       ),
//     );
//   }
// }
