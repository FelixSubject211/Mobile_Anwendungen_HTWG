
import 'package:objectbox/objectbox.dart';

@Entity()
class Habit {
  @Id() int id = 0;
  String name;

  Habit({
    required this.name,
  });
}