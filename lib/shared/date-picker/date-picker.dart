import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class DatePickerComponent extends StatefulWidget {
  final String fieldName;
  final InputDecoration? decoration;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateFormat? dateFormat;
  final DateTime? initialValue;
  final TimeOfDay? timeOfDay;
  final String label;
  const DatePickerComponent({super.key,required this.fieldName,required this.label,this.firstDate,this.initialValue, this.lastDate,this.dateFormat,this.timeOfDay,this.decoration});

  @override
  State<DatePickerComponent> createState() => _DatePickerComponentState();
}

class _DatePickerComponentState extends State<DatePickerComponent> {
  final GlobalKey<FormBuilderFieldState> _dateInputFieldKey = GlobalKey<FormBuilderFieldState>();
  @override
  Widget build(BuildContext context) {
    return   FormBuilderDateTimePicker(
      name: widget.fieldName,
      firstDate: widget.firstDate ?? DateTime(1970),
      lastDate:widget.lastDate ?? DateTime(2030),
      format:widget.dateFormat ??  DateFormat('yyyy-MM-dd'),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialValue: widget.initialValue ?? DateTime.now(),
      inputType: InputType.both,
      decoration: widget.decoration ?? InputDecoration(
        labelText: widget.label,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _dateInputFieldKey.currentState?.didChange(null);
          },
        ),
      ),
      initialTime: widget.timeOfDay ?? const TimeOfDay(hour: 8, minute: 0),
      // locale: const Locale.fromSubtags(languageCode: 'fr'),
    );
  }
}