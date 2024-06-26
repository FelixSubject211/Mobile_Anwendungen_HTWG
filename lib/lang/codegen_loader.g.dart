// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> de = {
    "save": "Speichern",
    "error": "Fehler",
    "noData": "Keine Daten",
    "edit": "Bearbeiten",
    "finish": "Fertig",
    "cancel": "Abbrechen",
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
    "confirmDeleteMessage":
        "Sind Sie sicher, dass Sie diese Gewohnheit löschen wollen?",
    "delete": "Löschen"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {"de": de};
}
