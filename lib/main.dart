import 'package:flutter/material.dart';
import 'package:modee_emrc_app/services/electricity-service/electricity-provider.dart';
import 'package:modee_emrc_app/shared/configurations/environment.dart';
import 'package:provider/provider.dart';

import 'boot_comp.dart';

void main() {
 const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.LOCAL,
  );
 Environment().initConfig(environment);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>ElectricityEMRCProvider())
        ],
      child: BootComp()
    );
  }
}
