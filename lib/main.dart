import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/provider_models/database_model.dart';
import 'package:flutter_todo/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DatabaseModel(),
      builder: (context, child) => MaterialApp.router(
        title: 'Flutter Demo',
        theme: FlexThemeData.light(scheme: FlexScheme.barossa),
        routerConfig: router,
      ),
    );
  }
}
