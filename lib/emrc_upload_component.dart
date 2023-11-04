import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:modee_emrc_app/shared/providers/boot_provider.dart';
import 'package:modee_emrc_app/shared/utility_service/stub_platform_utility_service.dart'
if (dart.library.io) 'package:modee_emrc_app/shared/utility_service/android_platform_utility_service.dart'
if (dart.library.html) 'package:modee_emrc_app/shared/utility_service/web_platform_utility_service.dart';
import 'package:provider/provider.dart';
class UploadComponent extends StatefulWidget {

  @override
  State<UploadComponent> createState() => _UploadComponentState();
}

class _UploadComponentState extends State<UploadComponent> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name:"uploadComponent",
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required()
      ]),
      builder: (FormFieldState<dynamic> field){
        return InputDecorator(
          decoration: InputDecoration(
            labelText:"Upload your document",
            contentPadding: EdgeInsets.all(8.0),
            border: InputBorder.none,
            errorText: field.errorText
          ),
          child: GestureDetector(
            onTap: ()async{
              FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true,withData:true,withReadStream: true);
              if (result != null) {
              await   PlatformUtilityService().downloadFile(result.files.first);
               Provider.of<BootProvider>(context,listen:false).selectedDocumentName = result.files.first.name;
              } else {
                // User canceled the picker
              }
            },
            child: Container(
              child: Text("Click Me")
            ),
          )
        );
      }
    );
  }
}