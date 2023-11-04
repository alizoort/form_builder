import 'package:flutter/material.dart';
import 'package:modee_emrc_app/shared/providers/boot_provider.dart';
import 'package:provider/provider.dart';

import 'boot_comp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[ChangeNotifierProvider(create: (context)=>BootProvider())],
      child: BootComp()
    );
  }
}
