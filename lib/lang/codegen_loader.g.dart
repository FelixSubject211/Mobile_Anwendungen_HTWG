// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> de = {
  "save": "Speichern",
  "error": "Fehler",
  "noData": "Keine Daten",
  "edit": "Bearbeiten",
  "finish": "Fertig",
  "cancel": "Abbrechen",
  "progressButton": "Fortschrittbutton",
  "habitsTitle": "Gewohnheiten",
  "habitsFloatingActionButtonTooltip": "Gewohnheit hinzufügen",
  "habitDetailAddTitle": "Gewohnheit Hinzufügen",
  "habitDetailEditTitle": "Gewohnheit Bearbeiten",
  "habitDetailNameLabelText": "Name",
  "statisticsTitle": "Statistik",
  "statisticsWeekSelection": "Woche",
  "statisticsMonthSelection": "Monat",
  "textIfItIsEmpty": "Du hast noch keine Gewohnheiten",
  "confirmDeleteTitle": "Gewohnheit Löschen",
  "confirmDeleteMessage": "Sind Sie sicher, dass Sie diese Gewohnheit löschen wollen?",
  "delete": "Löschen",
  "unknownErrorOccurred": "Ein unbekannter Fehler ist aufgetreten",
  "onboardingStartTitle": "Willkommen",
  "onboardingStartSubtitle": "Zeit, gute Gewohnheiten zu entwickeln",
  "onboardingStartButton": "Start",
  "yustoLogo": "Yusto Logo",
  "onboardingHabitsTitle": "Verfolgen Sie ihre Ziele",
  "onboardingHabitsSubtitle": "Erkunden Sie die App, finden Sie Ruhe, um gute Gewohnheiten zu erreichen",
  "onboardingStatisticsTitle": "Nützliche Statistiken",
  "onboardingStatisticsSubtitle": "Visualisieren Sie Ihren Fortschritt",
  "yusto": "YUSTO"
};
static const Map<String,dynamic> en = {
  "save": "Save",
  "error": "Error",
  "noData": "No Data",
  "edit": "Edit",
  "finish": "Finish",
  "cancel": "Cancel",
  "progressButton": "ProgressButton",
  "habitsTitle": "Habits",
  "habitsFloatingActionButtonTooltip": "Add Habit",
  "habitDetailAddTitle": "Add Habit",
  "habitDetailEditTitle": "Edit Habit",
  "habitDetailNameLabelText": "Name",
  "statisticsTitle": "Statistics",
  "statisticsWeekSelection": "Week",
  "statisticsMonthSelection": "Month",
  "textIfItIsEmpty": "You have no habits yet",
  "confirmDeleteTitle": "Delete Habit",
  "confirmDeleteMessage": "Are you sure you want to delete this habit?",
  "delete": "Delete",
  "unknownErrorOccurred": "An unknown error occurred",
  "onboardingStartTitle": "Welcome",
  "onboardingStartSubtitle": "Time to develop good habits",
  "onboardingStartButton": "Start",
  "yustoLogo": "Yusto Logo",
  "onboardingHabitsTitle": "Pursue your goals",
  "onboardingHabitsSubtitle": "Explore the app, find peace of mind to achieve good habits",
  "onboardingStatisticsTitle": "Useful statistics",
  "onboardingStatisticsSubtitle": "Visualize your progress",
  "yusto": "YUSTO"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"de": de, "en": en};
}
