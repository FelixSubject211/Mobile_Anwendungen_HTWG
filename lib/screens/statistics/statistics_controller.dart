import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_anwendungen/screens/statistics/statistics_model.dart';
import 'package:mobile_anwendungen/screens/statistics/statistics_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../lang/locale_keys.g.dart';

part 'statistics_controller.g.dart';

@riverpod
class StatisticsDefaultController extends _$StatisticsDefaultController implements StatisticsController {

  @override
  StatisticsModel build() {
    return StatisticsModel(
        selectedButton: LocaleKeys.statisticsWeekSelection.tr(),
        habits: List.empty()
    );
  }

  @override
  void onSegmentedControlPressed(String label) {
    state = state.copyWith(selectedButton: label);
  }
}
