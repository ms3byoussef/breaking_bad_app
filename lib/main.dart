import 'package:breaking_bad/app_router.dart';
import 'package:breaking_bad/constant/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreakingBadApp(
    appRouter: AppRouter(),
  ));
}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: MyColors.myYellow,
          appBarTheme: const AppBarTheme(color: Colors.transparent)),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
