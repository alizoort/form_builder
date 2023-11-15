import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:modee_emrc_app/services/minerals-service/minerals-service.dart';
import 'package:modee_emrc_app/shared/utility_service/navigation-service.dart';

class BootComp extends StatelessWidget{
  const BootComp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      navigatorKey: NavigationService.navigatorKey,
      home:Scaffold(
          appBar: AppBar(title: const Text("EMRC APP")),
          body:   const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
              child   : MineralsEMRCService()
          )
      ),
      supportedLocales: FormBuilderLocalizations.supportedLocales,
    );
  }

}