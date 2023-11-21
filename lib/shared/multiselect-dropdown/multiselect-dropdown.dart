import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../services/models/lookup.dart';

class MultiSelectDropdown<T extends Lookup> extends StatefulWidget {
  const MultiSelectDropdown({super.key,required this.fieldName,required this.label,required this.items,this.validators=const [],this.hint});
  final String fieldName;
  final List<T> items;
  final String label;
  final String? hint;
  final List<String? Function(List<T>?)> validators;
  @override
  State<MultiSelectDropdown<T>> createState() => _MultiSelectDropdownState<T>();
}

class _MultiSelectDropdownState<T extends Lookup> extends State<MultiSelectDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<T>>(
      onChanged: (List<T>? selectedItems){

      },
      name: widget.fieldName,
      builder: (FormFieldState<List<T>> field){
        return DropdownSearch<T>.multiSelection(
            compareFn: (T item1,T item2){
              return item1==item2;
            },
          items: widget.items,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: widget.label,
                hintText: widget.hint??"",
              ),
            ),
            popupProps: const PopupPropsMultiSelection.menu(
              showSelectedItems: true,
              showSearchBox: true,
            ),
            onChanged: (List<T>? item){
              field.didChange(item);
            }
        );
      }
    );
  }
}