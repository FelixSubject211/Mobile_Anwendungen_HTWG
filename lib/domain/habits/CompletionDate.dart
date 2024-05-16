import 'package:objectbox/objectbox.dart';

@Entity()
class CompletionDate {
  int id = 0;

  int dateMillis;

  CompletionDate({
    required this.dateMillis,
  });
}
