import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/shared/text_input_component/emrc_text_input_component.dart';
import 'package:modee_emrc_app/shared/upload_component/emrc_upload_component.dart';

class EMRCFORM extends StatefulWidget {
  const EMRCFORM({super.key});

  @override
  State<EMRCFORM> createState() => _EMRCFORMState();
}

class _EMRCFORMState extends State<EMRCFORM> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  var genderOptions = ['Male','Female','Other'];
  void onChanged(dynamic val) => debugPrint(val.toString());
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FormBuilder(
              key: _formKey,
              onChanged: (){
                _formKey.currentState?.save();
              //  debugPrint(_formKey.currentState?.value.toString());
              },
              autovalidateMode: AutovalidateMode.disabled,
              initialValue: const {

              },
              skipDisabled: true,
              child: LayoutBuilder(
                builder: (BuildContext context,BoxConstraints constraints){
                  final availableWidth = constraints.maxWidth;
                  final maxChildWidth = availableWidth <400 ?availableWidth : availableWidth / 2;
                  return Wrap(
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: maxChildWidth),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextInputComponent(fieldName: "email", label: "Email",validators: [  FormBuilderValidators.required(),
                              FormBuilderValidators.email()]),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ConstrainedBox(constraints: BoxConstraints(maxWidth: maxChildWidth),child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextInputComponent(onChanged:onChanged,fieldName: "password", label: "Password",obscureText: true,validators: [FormBuilderValidators.required()],),
                        )),
                        ConstrainedBox(constraints: BoxConstraints(maxWidth: maxChildWidth),child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UploadComponent (fieldName:"passportInput",label:"Passport document",validators:[FormBuilderValidators.required()]),
                        )),
                      ]
                  );
                }
              )
            ),
        ElevatedButton(
            onPressed: () {
              _formKey.currentState?.validate();
            },
            child: const Text("Submit")
        )
      ],
    );

  }
}