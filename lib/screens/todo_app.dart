import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';

class TodoApp extends StatelessWidget {
  final _taskController = TextEditingController();

  TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),

            // Add Task TextField
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add Task',
              ),
            ),
          ),

          // Add Task Button
          ElevatedButton(
            onPressed: () {
              final title = _taskController.text;
              if (title.isNotEmpty) {
                todoProvider.addTask(title);
                _taskController.clear();
              }
            },
            child: Text('Add Task'),
          ),

          Expanded(
            // List of Tasks
            child: Consumer<TodoProvider>(
              builder: (context, provider, child) {
                final todos = provider.todos;

                // If there are no tasks, display a message.
                if (todos.isEmpty) {
                  return Center(child: Text('No tasks yet.'));
                }

                // If there are tasks, display them in a list.
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];

                    // ListTile for each task
                    return ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                      // Checkbox to mark task as done
                      leading: Checkbox(
                        value: todo.isDone,
                        onChanged: (value) {
                          provider.toggleTask(index);

                          // SnackBar to show a message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                todo.isDone
                                    ? 'Task marked as incomplete ❌'
                                    : 'Task completed ✅',
                              ),
                            ),
                          );
                        },
                      ),

                      // Delete button
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          provider.deleteTask(index);

                          // SnackBar to show a message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Task deleted !'),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // add your signature
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Made with 🤍 by Madhur !',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
