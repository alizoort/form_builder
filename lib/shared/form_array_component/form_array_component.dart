import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/shared/form_array_component/constants.dart';

class FormArrayComponent extends StatefulWidget {
  final String fieldName;
  final String label;
  final InputDecoration decoration;
  final List<Widget> dynamicFields;
  final List<String? Function(Map<String,dynamic>?)> validators;
  const FormArrayComponent({super.key,required this.fieldName,required this.label, this.validators=const [],this.decoration=kFormArrayInputDecoration,this.dynamicFields=const []});

  @override
  State<FormArrayComponent> createState() => _FormArrayComponentState();
}

class _FormArrayComponentState extends State<FormArrayComponent> {
  GlobalKey<FormBuilderFieldState> formFieldKey = GlobalKey<FormBuilderFieldState>();
  List<FormBuilder> formRecords =[];
  setFormBuilderFieldValue(FormFieldState<dynamic> field){
    if(formRecords.isEmpty){
      field.didChange(null);
    }
    else {
      Map<String,dynamic> map ={};
      formRecords.asMap().forEach((int index,FormBuilder formBuilder){
        FormBuilderState? state = (formBuilder.key as GlobalKey<FormBuilderState>).currentState;
        if(state!=null){
          map["form_$index"]= state.value;
        }
      });
      field.didChange(map);
    }
  }
  save(){
    for (FormBuilder formBuilder in formRecords) {
      if((formBuilder.key as GlobalKey<FormBuilderState>).currentState!=null){
        ((formBuilder.key as GlobalKey<FormBuilderState>).currentState as FormBuilderState).save();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
   return FormBuilderField<Map<String,dynamic>?>(
     key:formFieldKey,
     onSaved: (Map<String,dynamic>? val){
       save();
     },
     decoration:widget.decoration,
     name: widget.fieldName,
     validator: FormBuilderValidators.compose([...widget.validators,(Map<String,dynamic>? val){
       for(int index=0;index<formRecords.length;index++){
         if((formRecords[index].key as GlobalKey<FormBuilderState>).currentState!=null && !(((formRecords[index].key as GlobalKey<FormBuilderState>).currentState as FormBuilderState).isValid)){
           return "Invalid Form";
         }
       }
       return null;
     }]),
     builder: (FormFieldState<dynamic> field){
       return InputDecorator(
         decoration: widget.decoration.copyWith(labelText: widget.label,errorText : field.errorText),
         child:Column(
           children:  [
             GestureDetector(onTap:(){
               GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
               setState((){
                 formRecords.add(FormBuilder(
                   autovalidateMode: AutovalidateMode.disabled,
                   onChanged: (){
                     formFieldKey.currentState?.save();
                 //    formFieldKey.currentState?.validate();
                     setFormBuilderFieldValue(field);
                   },
                   key: formKey,
                   child: Column(
                       children: [
                         ...widget.dynamicFields
                       ]
                   ),
                 ));
                 setFormBuilderFieldValue(field);
               });
             },child: const Icon(Icons.add)),
             ...formRecords.asMap().entries.map((entry){
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   GestureDetector(onTap:(){
                     setState((){
                       formRecords.removeAt(entry.key);
                       setFormBuilderFieldValue(field);
                     });
                   },child: const Icon(Icons.delete)),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: entry.value,
                   ),
                 ],
               );
             }).toList(),
           ],
         )
       );
     }
   );
  }
}