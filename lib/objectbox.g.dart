// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'domain/habits/CompletionDate.dart';
import 'domain/habits/Habit.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 4933774847501334240),
      name: 'Habit',
      lastPropertyId: const obx_int.IdUid(7, 1519975166456393104),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7150806586606125223),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5251352729535817138),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5114650160825505742),
            name: 'index',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 7831590582768626053),
            name: 'creationDate',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 2427150203127901892),
            name: 'reminding',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 1519975166456393104),
            name: 'habitFrequency',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[
        obx_int.ModelRelation(
            id: const obx_int.IdUid(1, 3165293421844515969),
            name: 'completionDates',
            targetId: const obx_int.IdUid(3, 5768749410228167719))
      ],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 5768749410228167719),
      name: 'CompletionDate',
      lastPropertyId: const obx_int.IdUid(2, 2758452046988340640),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 5485435159034364373),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 2758452046988340640),
            name: 'dateMillis',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(3, 5768749410228167719),
      lastIndexId: const obx_int.IdUid(1, 1373669356522302806),
      lastRelationId: const obx_int.IdUid(1, 3165293421844515969),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [2271560381588274515],
      retiredIndexUids: const [1373669356522302806],
      retiredPropertyUids: const [
        5772066262068371116,
        2849403198628120101,
        6188093224734784656
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Habit: obx_int.EntityDefinition<Habit>(
        model: _entities[0],
        toOneRelations: (Habit object) => [],
        toManyRelations: (Habit object) => {
              obx_int.RelInfo<Habit>.toMany(1, object.id):
                  object.completionDates
            },
        getId: (Habit object) => object.id,
        setId: (Habit object, int id) {
          object.id = id;
        },
        objectToFB: (Habit object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.index);
          fbb.addInt64(4, object.creationDate);
          fbb.addBool(5, object.reminding);
          fbb.addInt64(6, object.habitFrequency);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final indexParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final creationDateParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final remindingParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 14, false);
          final object = Habit(
              name: nameParam,
              index: indexParam,
              creationDate: creationDateParam,
              reminding: remindingParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..habitFrequency = const fb.Int64Reader()
                .vTableGetNullable(buffer, rootOffset, 16);
          obx_int.InternalToManyAccess.setRelInfo<Habit>(object.completionDates,
              store, obx_int.RelInfo<Habit>.toMany(1, object.id));
          return object;
        }),
    CompletionDate: obx_int.EntityDefinition<CompletionDate>(
        model: _entities[1],
        toOneRelations: (CompletionDate object) => [],
        toManyRelations: (CompletionDate object) => {},
        getId: (CompletionDate object) => object.id,
        setId: (CompletionDate object, int id) {
          object.id = id;
        },
        objectToFB: (CompletionDate object, fb.Builder fbb) {
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.dateMillis);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dateMillisParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final object = CompletionDate(dateMillis: dateMillisParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Habit] entity fields to define ObjectBox queries.
class Habit_ {
  /// see [Habit.id]
  static final id = obx.QueryIntegerProperty<Habit>(_entities[0].properties[0]);

  /// see [Habit.name]
  static final name =
      obx.QueryStringProperty<Habit>(_entities[0].properties[1]);

  /// see [Habit.index]
  static final index =
      obx.QueryIntegerProperty<Habit>(_entities[0].properties[2]);

  /// see [Habit.creationDate]
  static final creationDate =
      obx.QueryIntegerProperty<Habit>(_entities[0].properties[3]);

  /// see [Habit.reminding]
  static final reminding =
      obx.QueryBooleanProperty<Habit>(_entities[0].properties[4]);

  /// see [Habit.habitFrequency]
  static final habitFrequency =
      obx.QueryIntegerProperty<Habit>(_entities[0].properties[5]);

  /// see [Habit.completionDates]
  static final completionDates =
      obx.QueryRelationToMany<Habit, CompletionDate>(_entities[0].relations[0]);
}

/// [CompletionDate] entity fields to define ObjectBox queries.
class CompletionDate_ {
  /// see [CompletionDate.id]
  static final id =
      obx.QueryIntegerProperty<CompletionDate>(_entities[1].properties[0]);

  /// see [CompletionDate.dateMillis]
  static final dateMillis =
      obx.QueryIntegerProperty<CompletionDate>(_entities[1].properties[1]);
}
