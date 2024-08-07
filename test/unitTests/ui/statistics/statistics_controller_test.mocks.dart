// Mocks generated by Mockito 5.4.4 from annotations
// in mobile_anwendungen/test/unitTests/ui/statistics/statistics_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mobile_anwendungen/domain/habit/habit_repository.dart' as _i2;
import 'package:mobile_anwendungen/domain/habit/model/habit.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [HabitRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHabitRepository extends _i1.Mock implements _i2.HabitRepository {
  MockHabitRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<_i4.Habit>> habits() => (super.noSuchMethod(
        Invocation.method(
          #habits,
          [],
        ),
        returnValue: _i3.Stream<List<_i4.Habit>>.empty(),
      ) as _i3.Stream<List<_i4.Habit>>);

  @override
  void upsertHabit(_i4.Habit? habit) => super.noSuchMethod(
        Invocation.method(
          #upsertHabit,
          [habit],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void completeHabit(_i4.Habit? habit) => super.noSuchMethod(
        Invocation.method(
          #completeHabit,
          [habit],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void unCompleteHabit(_i4.Habit? habit) => super.noSuchMethod(
        Invocation.method(
          #unCompleteHabit,
          [habit],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void reorderHabit(
    int? oldIndex,
    int? newIndex,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #reorderHabit,
          [
            oldIndex,
            newIndex,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void deleteHabit(_i4.Habit? habit) => super.noSuchMethod(
        Invocation.method(
          #deleteHabit,
          [habit],
        ),
        returnValueForMissingStub: null,
      );

  @override
  int nextIndex() => (super.noSuchMethod(
        Invocation.method(
          #nextIndex,
          [],
        ),
        returnValue: 0,
      ) as int);

  @override
  _i4.Habit? getById(int? id) => (super.noSuchMethod(Invocation.method(
        #getById,
        [id],
      )) as _i4.Habit?);
}
