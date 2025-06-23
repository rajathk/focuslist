import 'package:flutter/material.dart';
import 'package:focuslist/views/widgets/todo_item_tile.dart';
import 'package:provider/provider.dart';
import '../view_models/todo_view_model.dart';

final pastelColors = [
  Color(0xFFE9FBF8), // Very light Mint
  Color(0xFFFFF1E8), // Very light Peach
  Color(0xFFF7ECFB), // Very light Lavender
  Color(0xFFFFFDE7), // Very light Yellow
];

class TodoScreen extends StatelessWidget {

  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('FocusList'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: viewModel.todos.length,
            itemBuilder: (context, index){
              final todo = viewModel.todos[index];
              final bgColor = pastelColors[index % pastelColors.length];
              return Card(
                color: bgColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: TodoItemTile(
                  todo: todo,
                  onTap: () => viewModel.toggleTodoStatus(todo.id),
                  onDelete: () {
                    viewModel.removeTodo(todo.id);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _showAddTodoDialog(context)),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final TextEditingController dialogController = TextEditingController();
    final viewModel = Provider.of<TodoViewModel>(context, listen: false);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: dialogController,
            autofocus: true,
            decoration: InputDecoration(hintText: 'Enter task name'),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
            ),
            ElevatedButton(
                onPressed: (){
                  final task = dialogController.text.trim();
                  viewModel.addTodo(task);
                  Navigator.pop(context);
                },
                child: Text('Add')
            )
          ],
        ));
  }
}