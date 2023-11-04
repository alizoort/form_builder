import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modee_emrc_app/emrc_upload_component.dart';
import 'package:modee_emrc_app/shared/doc_viewer/stub_doc_viewer.dart'
if(dart.library.io) 'package:modee_emrc_app/shared/doc_viewer/android_doc_viewer.dart'
if(dart.library.html) 'package:modee_emrc_app/shared/doc_viewer/web_doc_viewer.dart';
import 'package:modee_emrc_app/shared/providers/boot_provider.dart';
import 'package:provider/provider.dart';

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
  bool _ageHasError = false;
  bool _genderHasError = false;
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
          UploadComponent(),
          ElevatedButton(
            onPressed: () {
              _formKey.currentState?.validate();
            },
            child: Text("Submit")
          ),
          ElevatedButton(
              onPressed: () {
                if(Provider.of<BootProvider>(context,listen:false).selectedDocumentName.isNotEmpty){
                  DocViewer().getFile(context);
                }
              },
              child: Text("Submit")
          )
        ]
      )
    );
  }
}