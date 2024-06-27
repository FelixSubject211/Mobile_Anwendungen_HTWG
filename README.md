# Yusto

## Abstract

The app allows users to create, manage, and track daily habits. Users can add, edit, and view their progress in weekly and monthly views. The app uses Flutter for an engaging user interface and Riverpod for efficient state management. Easy Localization provides multilingual support.


// i18n
flutter pub run easy_localization:generate -S  ./assets/lang -O lib/lang
flutter pub run easy_localization:generate -S ./assets/lang -O ./lib/lang -o locale_keys.g.dart -f keys

// db
dart run build_runner build  

// vor den pushen
- "Dart format ." ausführen
- "flutter analyze" ausführen und fehler beheben


// 
- flutter clean
- flutter pub get
- flutter pub run build_runner build --delete-conflicting-outputs


