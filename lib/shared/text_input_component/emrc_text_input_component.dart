import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/shared/text_input_component/constants.dart';

class TextInputComponent extends StatefulWidget {
  final String fieldName;
  final String label;
  final InputDecoration? decoration;
  final List<String? Function(String?)> validators;
  final bool obscureText;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final bool readOnly;
  final AutovalidateMode? autovalidateMode;
  final int maxLines;
  final TextInputType? textInputType;
  final dynamic Function(String?)? valueTransformer;
  const TextInputComponent({super.key,required this.fieldName,required this.label,this.validators= const[],this.obscureText=false,
  this.readOnly=false,this.autovalidateMode=AutovalidateMode.disabled,this.maxLines =1,this.decoration ,this.onChanged,this.initialValue,this.valueTransformer,this.textInputType});

  @override
  State<TextInputComponent> createState() => _TextInputComponentState();
}

class _TextInputComponentState extends State<TextInputComponent> {
  final GlobalKey<FormBuilderFieldState> _textInputFieldKey = GlobalKey<FormBuilderFieldState>();
  @override
  Widget build(BuildContext context) {
    return  FormBuilderTextField(
      key:_textInputFieldKey,
      cursorColor:kTextInputFocusColor,
      keyboardType: widget.textInputType,
      valueTransformer: widget.valueTransformer,
      maxLines: widget.maxLines,
      autovalidateMode: widget.autovalidateMode,
      readOnly:widget.readOnly,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged ?? (String? t){},
      name: widget.fieldName,
      decoration: widget.decoration != null ? widget.decoration?.copyWith(labelText: widget.label) as InputDecoration : kTextInputDecoration.copyWith(labelText: widget.label).copyWith(  floatingLabelStyle: _textInputFieldKey.currentState?.errorText !=null ?  const TextStyle(color:Colors.red):kTextInputFloatingLabelStyle ,),
      obscureText: widget.obscureText,
      validator: FormBuilderValidators.compose(widget.validators),
    );
  }
}