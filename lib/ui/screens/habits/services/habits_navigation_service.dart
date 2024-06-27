import 'package:flutter/widgets.dart';
import 'package:mobile_anwendungen/domain/navigation/general_navigation_service.dart';

abstract class HabitsNavigationService implements GeneralNavigationService {
  void showHabitDetail(int? id, BuildContext context);
  void showConfirmDeleteAlert(VoidCallback onConfirm);
}
