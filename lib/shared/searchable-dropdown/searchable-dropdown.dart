import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modee_emrc_app/shared/text_input_component/constants.dart';

import '../../services/models/lookup.dart';

class SearchableDropdown<T extends Lookup> extends StatefulWidget {
  final String fieldName;
  final List<String? Function(T?)> validators;
  final List<T> items;
  final String label;
  final String? hint;
  const SearchableDropdown({super.key,required this.label,required this.items,required this.fieldName,this.validators=const [],this.hint});
  @override
  State<SearchableDropdown<T>> createState() => _SearchableDropdownState<T>();
}

class _SearchableDropdownState<T extends Lookup> extends State<SearchableDropdown<T>> {
  final GlobalKey<FormBuilderFieldState> _dropdownFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      onChanged:(T? item){

      },
      name:widget.fieldName,
      builder: (FormFieldState<T> field){
        return DropdownSearch<T>(
          compareFn: (T item1,T item2){
            return item1==item2;
          },
          popupProps:  PopupProps.menu(
            searchFieldProps: TextFieldProps(decoration: kTextInputDecoration),
            showSelectedItems: true,
            showSearchBox: true
          ),
          items: widget.items,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hint??"",
            ),
          ),
          onChanged: (T? item){
            field.didChange(item);
          },
        );
      }
    );
  }
}