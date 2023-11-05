import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/shared/dropdown/constants.dart';

class DropdownInputComponent<T> extends StatefulWidget {
  final String name;
  final String labelText;
  final List<DropdownMenuItem<T>> items;
  final InputDecoration decoration;
  final T? initialValue;
  final bool withReset;
  final List<String? Function(T?)> validator;
  final void Function(T?)? onChanged;
  const DropdownInputComponent({super.key,required this.name,required this.labelText,required this.items,this.decoration=kDropdownInputDecoration,this.withReset=false,this.validator=const [],this.initialValue,this.onChanged});

  @override
  State<DropdownInputComponent<T>> createState() => _DropdownInputComponentState<T>();
}

class _DropdownInputComponentState<T> extends State<DropdownInputComponent<T>> {
  final GlobalKey<FormBuilderFieldState> _dropdownFieldKey = GlobalKey<FormBuilderFieldState>();
  @override
  Widget build(BuildContext context)  {
    return FormBuilderDropdown<T>(
      onChanged: widget.onChanged,
      validator: FormBuilderValidators.compose(widget.validator),
      key: _dropdownFieldKey,
      name: widget.name,
      initialValue: widget.initialValue,
      decoration: widget.decoration.copyWith(labelText: widget.labelText, suffix:  ConstrainedBox(constraints: const BoxConstraints(
        maxWidth: 30.0,
        maxHeight: 30
      ),child:IconButton(
        padding: const EdgeInsets.all(0),
        icon: const Icon(Icons.close),
        onPressed: () {
          _dropdownFieldKey.currentState?.reset();
        },
      ))
      ),
      items: widget.items
    );
  }
}