import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/shared/text_input_component/emrc_text_input_component.dart';
import 'package:modee_emrc_app/shared/upload_component/emrc_upload_component.dart';
import 'package:modee_emrc_app/shared/dropdown/dropdown_input_component.dart';
import './mineralExtractionLicenseRenewal-controller.dart';
import 'package:modee_emrc_app/services/mineralExtractionLicenseRenewal-service/mineralExtractionLicenseRenewal-provider.dart';
import 'package:modee_emrc_app/shared/providers/emrc-provider.dart';
import 'package:provider/provider.dart';
class MineralExtractionLicenseRenewalEMRCService extends StatefulWidget {
  const MineralExtractionLicenseRenewalEMRCService({super.key});

  @override
  State<MineralExtractionLicenseRenewalEMRCService> createState() => _MineralExtractionLicenseRenewalEMRCServiceState();
}

class _MineralExtractionLicenseRenewalEMRCServiceState extends State<MineralExtractionLicenseRenewalEMRCService> {
  bool autoValidate = true;
  bool readOnly = false;
  final _formKey = GlobalKey<FormBuilderState>();
  void onChanged(dynamic val) => debugPrint(val.toString());
  @override
  Widget build(BuildContext context) {
    EMRCProvider emrcProvider = Provider.of<MineralExtractionLicenseRenewalEMRCProvider>(context);
    return FutureBuilder(
      future: MineralExtractionLicenseRenewalEMRCController(context: context).initModule(),
      builder: (BuildContext context,AsyncSnapshot<String> snapshot){
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
                            child: TextInputComponent(fieldName: 'email', label: 'email',validators: [  FormBuilderValidators.required(),
                             ]),
                          ),
                        ),
                                                                                                                                                   ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: maxChildWidth),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextInputComponent(fieldName: 'description', label: 'description',validators: [  FormBuilderValidators.required(),
                             ]),
                          ),
                        ),
                                                                                                                                                                                                     ConstrainedBox(
                               constraints: BoxConstraints(maxWidth: maxChildWidth),
                               child: const Padding(
                               padding: EdgeInsets.all(8.0),
                               child: DropdownInputComponent<String>(labelText:'gender',items: [],name: 'gender',),
                            ),
                         ),
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
    );

  }
}