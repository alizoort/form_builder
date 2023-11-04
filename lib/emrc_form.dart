import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/emrc_upload_component.dart';

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
  void _onChanged(dynamic val) => debugPrint(val.toString());
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      onChanged: (){
        _formKey.currentState?.save();
        debugPrint(_formKey.currentState?.value.toString());
      },
      autovalidateMode: AutovalidateMode.disabled,
      initialValue: const {

      },
      skipDisabled: true,
      child: ListView(
        children: <Widget>[
          FormBuilderTextField(

            name: 'email',
            decoration: const InputDecoration(labelText: 'Email'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'password',
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          UploadComponent(),
          ElevatedButton(
            onPressed: () {
              _formKey.currentState?.validate();
            },
            child: Text("Submit")
          )
        ]
      )
    );
  }
}