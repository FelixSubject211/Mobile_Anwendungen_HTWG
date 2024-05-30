import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';

enum HabitFrequency implements Comparable<HabitFrequency> {
  daily(value: 1),
  weekly(value: 7),
  monthly(value: 30);

  const HabitFrequency({required this.value});

  final int value;

  @override
  int compareTo(HabitFrequency other) => value - other.value;

  @override
  String toString() {
    switch (value) {
      case 7:
        return LocaleKeys.weekly.tr();
      case 30:
        return LocaleKeys.monthly.tr();
      default:
        return LocaleKeys.daily.tr();
    }
  }
}
