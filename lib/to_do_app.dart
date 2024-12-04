import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'core/themes/my_colors.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  String initialRoute;

  MyApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      theme:
          ThemeData(primarySwatch: Colors.blue, canvasColor: MyColors.liteGray),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
