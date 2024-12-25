import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rgr_app/production.dart';
import 'package:rgr_app/task.dart';
import 'package:rgr_app/add_task_screen.dart';
import 'package:rgr_app/edit_task_screen.dart';

class TaskScreen extends StatefulWidget {
  final Production production;

  TaskScreen({required this.production});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [];

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пользователь не авторизован')),
      );
      return;
    }

    setState(() {
      tasks = [
        Task(
            id: '1',
            title: 'Заказ 1',
            description: 'Описание заказа 1',
            productionId: widget.production.id,
            status: 'new'),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _addTask() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(production: widget.production),
      ),
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  void _editTask(Task task) async {
    final updatedTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTaskScreen(
          task: task,
          onTaskUpdated: (updatedTask) {
            setState(() {
              final index = tasks.indexWhere((t) => t.id == updatedTask.id);
              if (index != -1) {
                tasks[index] = updatedTask;
              }
            });
          },
        ),
      ),
    );
  }

  void _deleteTask(String taskId) {
    setState(() {
      tasks.removeWhere((task) => task.id == taskId);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Заказ удалён')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Заказы производства: ${widget.production.title}')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteTask(task.id),
              tooltip: 'Удалить заказ',
            ),
            onTap: () => _editTask(task),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
        tooltip: 'Добавить заказ',
      ),
    );
  }
}

