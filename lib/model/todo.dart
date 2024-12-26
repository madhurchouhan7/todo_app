// imported hive package,
import 'package:hive/hive.dart';

// This connects the main file to generated code,
// created by hive builder.
part 'todo.g.dart';

// This tell hive that the todo class is a type of data to be stored.
// in the database,
//typeID is the unique for each model in your app,
@HiveType(typeId: 0)
class Todo {
  Todo({
    required this.title,
    this.isDone = false,
  });

  // This tells hive that the title is a field to be stored in the database.
  @HiveField(0)

  // This is the title of the task.
  final String title;

  // This tells hive that the isDone is a field to be stored in the database.
  @HiveField(1)

  // This is the status of the task.
  final bool isDone;
}
