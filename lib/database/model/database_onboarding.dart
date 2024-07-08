import 'package:objectbox/objectbox.dart';

@Entity()
class DatabaseOnboarding {
  int id = 0;
  bool completed;

  DatabaseOnboarding({
    this.id = 0,
    required this.completed,
  });
}
