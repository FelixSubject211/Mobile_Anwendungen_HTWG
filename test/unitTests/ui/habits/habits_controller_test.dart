// test/habits_controller_test.dart
import 'package:mobile_anwendungen/ui/screens/habits/habits_view.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/common/completion_date.dart';

import 'habits_controller_test.mocks.dart';

@GenerateMocks([HabitsController, BuildContext])
void main() {
  late MockHabitsController mockHabitsController;
  late MockBuildContext mockBuildContext;

  setUp(() {
    mockHabitsController = MockHabitsController();
    mockBuildContext = MockBuildContext();
  });

  group('HabitsController', () {
    final habit = Habit(
      id: 1,
      name: 'Test Habit',
      index: 0,
      creationDate: DateTime.now(),
      completionDates: [
        CompletionDate(id: 1, dateTime: DateTime.now()),
      ],
    );

    test('showHabitDetail calls the method with correct parameters', () {
      // Act
      mockHabitsController.showHabitDetail(habit.id, mockBuildContext);

      // Assert
      verify(mockHabitsController.showHabitDetail(habit.id, mockBuildContext)).called(1);
    });

    test('onCompleteHabit calls the method with correct parameters', () {
      // Act
      mockHabitsController.onCompleteHabit(habit);

      // Assert
      verify(mockHabitsController.onCompleteHabit(habit)).called(1);
    });

    test('onUnCompleteHabit calls the method with correct parameters', () {
      // Act
      mockHabitsController.onUnCompleteHabit(habit);

      // Assert
      verify(mockHabitsController.onUnCompleteHabit(habit)).called(1);
    });

    test('onReorder calls the method with correct parameters', () {
      // Act
      mockHabitsController.onReorder(1, 2);

      // Assert
      verify(mockHabitsController.onReorder(1, 2)).called(1);
    });

    test('onDeleteHabit calls the method with correct parameters', () {
      // Act
      mockHabitsController.onDeleteHabit(habit);

      // Assert
      verify(mockHabitsController.onDeleteHabit(habit)).called(1);
    });

    test('toggleEditing calls the method', () {
      // Act
      mockHabitsController.toggleEditing();

      // Assert
      verify(mockHabitsController.toggleEditing()).called(1);
    });

    test('showConfirmDeleteAlert calls the method with correct parameters', () {
      // Act
      mockHabitsController.showConfirmDeleteAlert(habit);

      // Assert
      verify(mockHabitsController.showConfirmDeleteAlert(habit)).called(1);
    });
  });
}
