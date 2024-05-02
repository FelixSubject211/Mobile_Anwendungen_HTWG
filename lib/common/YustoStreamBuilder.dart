import 'package:flutter/material.dart';

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
          child: Text('Error: ${snapshot.error}'),
        );
      } else if (!snapshot.hasData) {
        return const Center(
          child: Text('No Data'),
        );
      } else {
        return onData(context, snapshot.data!);
      }
    },
  );
}
