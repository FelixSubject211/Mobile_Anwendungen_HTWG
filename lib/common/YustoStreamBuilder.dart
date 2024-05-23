import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';

Widget yustoStreamBuilder<T>({
  required Stream<T> stream,
  required Widget Function(BuildContext, T) onData,
  Widget Function(BuildContext)? onLoading,
  Widget Function(BuildContext, dynamic)? onError,
}) {
  return StreamBuilder<T>(
    stream: stream,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return onLoading != null
            ? onLoading(context)
            : const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return onError != null
            ? onError(context, snapshot.error)
            : Center(
          child: Text('${LocaleKeys.error.tr()}: ${snapshot.error}'),
        );
      } else if (!snapshot.hasData || snapshot.data == null) {
        return Center(
          child: Text(LocaleKeys.noData.tr()),
        );
      } else {
        return onData(context, snapshot.data!);
      }
    },
  );
}
