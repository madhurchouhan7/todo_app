# Todo App with Hive and Provider

This is a simple Todo application built using **Flutter**, utilizing **Hive** for local storage and **Provider** for state management. The app demonstrates basic CRUD (Create, Read, Update, Delete) operations with a focus on clean architecture and efficient data handling.

## Features
- Add new tasks.
- Mark tasks as complete/incomplete.
- View all tasks in a dynamic list.
- Persistent storage using Hive database.

## Screenshots
(Add screenshots of the app here if possible)

## Prerequisites
- Flutter installed ([Flutter installation guide](https://docs.flutter.dev/get-started/install)).
- Dart SDK.

## Getting Started
Follow these steps to run the application locally:

### Clone the Repository
```bash
git clone https://github.com/your-username/todo-hive-provider.git
cd todo-hive-provider
```

### Install Dependencies
Run the following command to install all required dependencies:
```bash
flutter pub get
```

### Generate Hive Adapter
Run the following command to generate the `todo.g.dart` file:
```bash
flutter packages pub run build_runner build
```

### Run the Application
Use the command below to start the app:
```bash
flutter run
```

## Project Structure
```
lib/
|-- models/
|   |-- todo.dart         # Todo model definition
|-- screens/
|   |-- task_list_screen.dart  # Main screen to display tasks
|-- main.dart             # Application entry point
```

## Dependencies
The project uses the following dependencies:
- **Hive**: Lightweight and fast key-value database.
- **Hive Flutter**: Flutter integration for Hive.
- **Provider**: State management for clean architecture.

Add these dependencies in `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  provider: ^6.1.3

dev_dependencies:
  build_runner: ^2.4.6
  hive_generator: ^1.1.3
```

## Code Explanation
### Hive Initialization
In `main.dart`, Hive is initialized to prepare the local storage:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('taskbox');
  runApp(MyApp());
}
```
### Todo Model
The `Todo` model defines the structure of tasks:
```dart
@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final bool isDone;

  Todo({required this.title, this.isDone = false});
}
```
### Task List Screen
The main screen (`task_list_screen.dart`) displays all tasks and allows interaction (adding, marking complete, etc.).

## Contribution
Feel free to contribute to this project. Fork the repository, make changes, and submit a pull request.

## License
This project is licensed under the MIT License.

---
Happy Coding! 😊
