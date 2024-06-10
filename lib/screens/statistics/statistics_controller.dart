import 'package:mobile_anwendungen/screens/statistics/statistics_model.dart';
import 'package:mobile_anwendungen/screens/statistics/statistics_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'statistics_controller.g.dart';

@riverpod
class StatisticDefaultController extends _$StatisticDefaultController implements StatisticController {

  StatisticsModel build({
    required final String selectedButton
  }) {

  }

  @override
  void onSegmentedControlPressed(String label) {
    // TODO: implement onSegmentedControlPressed
  }
}