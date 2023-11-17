import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/shared/form_array_component/form_array_component.dart';
import 'package:modee_emrc_app/shared/text_input_component/emrc_text_input_component.dart';
import 'package:modee_emrc_app/shared/upload_component/emrc_upload_component.dart';
import 'package:modee_emrc_app/shared/dropdown/dropdown_input_component.dart';
import './electricity-controller.dart';
import 'package:modee_emrc_app/services/electricity-service/electricity-provider.dart';
import 'package:modee_emrc_app/shared/providers/emrc-provider.dart';
import 'package:provider/provider.dart';
class ElectricityEMRCService extends StatefulWidget {
  const ElectricityEMRCService({super.key});

  @override
  State<ElectricityEMRCService> createState() => _ElectricityEMRCServiceState();
}

class _ElectricityEMRCServiceState extends State<ElectricityEMRCService> {
  bool autoValidate = true;
  bool readOnly = false;
  final _formKey = GlobalKey<FormBuilderState>();
  void onChanged(dynamic val) => debugPrint(val.toString());
  @override
  Widget build(BuildContext context) {
    EMRCProvider emrcProvider = Provider.of<ElectricityEMRCProvider>(context);
    return FutureBuilder(
      future: ElectricityEMRCController(context: context).initModule(),
      builder: (BuildContext context,AsyncSnapshot<String> snapshot){
        return ListView(
        children: [
        FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              skipDisabled: true,
              child: LayoutBuilder(
                builder: (BuildContext context,BoxConstraints constraints){
                  final availableWidth = constraints.maxWidth;
                  final maxChildWidth = availableWidth <400 ?availableWidth : availableWidth / 2;
                  return Wrap(
                      children:  <Widget>[
                        FormArrayComponent(fieldName: "formArray",  label: "Form Array",dynamicFields:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextInputComponent(fieldName: 'lastName', label: 'lastName',validators: [
                            FormBuilderValidators.required()
                          ]),
                        ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextInputComponent(fieldName: 'firstName', label: 'firstName',validators: [
                            ]),
                          ),
                          FormArrayComponent(fieldName: "formArrayNested",  label: "Form Array",dynamicFields:[Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextInputComponent(fieldName: 'lastName', label: 'lastName',validators: [
                              FormBuilderValidators.required()
                            ]),
                          ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextInputComponent(fieldName: 'firstName', label: 'firstName',validators: [
                              ]),
                            )])])
                      ]
                  );
                }
              )
            ),
        ElevatedButton(
            onPressed: () {
               _formKey.currentState?.save();
               print(_formKey.currentState?.isValid);
                _formKey.currentState?.validate();
             print("VALUE ${ _formKey.currentState?.fields['formArray']?.value}");

            },
            child: const Text("Submit")
        )
      ],
    );
      }
    );

  }
}