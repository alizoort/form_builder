import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckBoxComponent extends StatefulWidget {
  final String fieldName;
  final void Function(bool?)? onChanged;
  final bool? initialValue;
  final String label;
  const CheckBoxComponent({super.key,required this.label,required this.fieldName,this.onChanged,this.initialValue});

  @override
  State<CheckBoxComponent> createState() => _CheckBoxComponentState();
}

class _CheckBoxComponentState extends State<CheckBoxComponent> {
  @override
  Widget build(BuildContext context) {
     return  FormBuilderCheckbox(
       name: widget.fieldName,
       initialValue: widget.initialValue,
       onChanged: widget.onChanged,
       title: RichText(
         text:TextSpan(
           children: [
             TextSpan(
               text: widget.label,
               style: const TextStyle(color: Colors.black),
             ),
           ],
         ),
       ),
     );
  }
}