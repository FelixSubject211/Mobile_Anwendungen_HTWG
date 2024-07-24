import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/domain/habit/habit_default_repository.dart';
import 'package:mobile_anwendungen/database/model/database_habit.dart';
import 'package:mobile_anwendungen/database/database.dart';
import 'package:mobile_anwendungen/common/completion_date.dart';
import 'package:mockito/annotations.dart';

import 'habit_default_repository_test.mocks.dart';

@GenerateMocks([Database])
void main() {
  late MockDatabase mockDatabase;
  late HabitDefaultRepository repository;

  setUp(() {
    mockDatabase = MockDatabase();
    repository = HabitDefaultRepository(database: mockDatabase);
  });

  group('HabitDefaultRepository', () {

    bool habitEqualsIgnoringCreationDate(Habit habit1, Habit habit2) {
      return habit1.id == habit2.id &&
          habit1.name == habit2.name &&
          habit1.index == habit2.index;
    }

    Future<bool> containsHabitInStream(Stream<List<Habit>> stream, Habit habit) async {
      await for (var habitList in stream) {
        if (habitList.any((h) => habitEqualsIgnoringCreationDate(h, habit))) {
          return true;
        }
      }
      return false;
    }

    test('should stream updated habits when upsertHabit is called', () async {
      // Arrange
      final creationDate = DateTime.now();

      final habit = Habit(
        id: 1,
        name: 'Test Habit',
        index: 0,
        creationDate: creationDate,
        completionDates: [],
      );

      final dbHabit = DatabaseHabit(
        id: habit.id,
        name: habit.name,
        index: habit.index,
        creationDate: habit.creationDate.millisecondsSinceEpoch
      );

      when(mockDatabase.listHabits()).thenReturn([dbHabit]);

      // Act
      repository.upsertHabit(habit);

      // Assert
      final containsHabit = await containsHabitInStream(repository.habits(), habit);

      expect(containsHabit, isTrue);

      verify(mockDatabase.upsertHabit(any)).called(1);
    });

    test('should stream updated habits when completeHabit is called', () async {
      // Arrange
      final creationDate = DateTime.now();
      final completionDate = DateTime.now();

      final habit = Habit(
        id: 1,
        name: 'Test Habit',
        index: 0,
        creationDate: creationDate,
        completionDates: [CompletionDate(id: 1, dateTime: completionDate)],
      );

      final dbHabit = DatabaseHabit(
        id: habit.id,
        name: habit.name,
        index: habit.index,
        creationDate: habit.creationDate.millisecondsSinceEpoch
      );

      when(mockDatabase.listHabits()).thenReturn([dbHabit]);

      // Act
      repository.completeHabit(habit);

      // Assert
      final containsHabit = await containsHabitInStream(repository.habits(), habit);

      expect(containsHabit, isTrue);

      verify(mockDatabase.completeHabit(any)).called(1);
    });

    test('should stream updated habits when unCompleteHabit is called', () async {
      // Arrange
      final creationDate = DateTime.now();
      final habit = Habit(
        id: 1,
        name: 'Test Habit',
        index: 0,
        creationDate: creationDate,
        completionDates: [],
      );

      final dbHabit = DatabaseHabit(
        id: habit.id,
        name: habit.name,
        index: habit.index,
        creationDate: habit.creationDate.millisecondsSinceEpoch
      );

      when(mockDatabase.listHabits()).thenReturn([dbHabit]);

      // Act
      repository.unCompleteHabit(habit);

      // Assert
      final containsHabit = await containsHabitInStream(repository.habits(), habit);

      expect(containsHabit, isTrue);

      verify(mockDatabase.unCompleteHabit(any)).called(1);
    });

    test('should stream updated habits when deleteHabit is called', () async {
      // Arrange
      final creationDate = DateTime.now();
      final habit = Habit(
        id: 1,
        name: 'Test Habit',
        index: 0,
        creationDate: creationDate,
        completionDates: [],
      );

      when(mockDatabase.listHabits()).thenReturn([]);

      // Act
      repository.deleteHabit(habit);

      // Assert
      await repository.habits().first.then((habitList) {
        expect(habitList, []);
      });

      verify(mockDatabase.deleteHabit(any)).called(1);
    });
  });
}
