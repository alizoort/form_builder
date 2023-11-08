import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:modee_emrc_app/services/electricity-service/electricity-service-controller.dart';
import 'package:modee_emrc_app/services/electricity-service/electricity-service.dart';
import 'package:modee_emrc_app/shared/enums/screen_enum.dart';
import 'package:modee_emrc_app/shared/utility_service/navigation-service.dart';

class BootComp extends StatelessWidget{
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
      initialRoute: '/${Screen.homeView.toShortString()}',
      navigatorKey: NavigationService.navigatorKey,
      routes: {
        '/${Screen.homeView.toShortString()}':(context){
          return Scaffold(
              appBar: AppBar(title: const Text("EMRC APP")),
              body: const Padding(
                padding: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
                child: ElectricityEMRCService(),
              )
          );
        }
      },
      supportedLocales: FormBuilderLocalizations.supportedLocales,
    );
  }

}