import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyAppMock extends StatelessWidget {
  const MyAppMock({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: EasyLocalization.of(context)!.locale,
      supportedLocales: EasyLocalization.of(context)!.supportedLocales,
      localizationsDelegates: EasyLocalization.of(context)!.delegates,
      home: child,
    );
  }
}
