import 'package:flutter/material.dart';
import 'package:rgr_app/task.dart';
import 'package:rgr_app/production.dart';

class AddTaskScreen extends StatelessWidget {
  final Production production;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  AddTaskScreen({required this.production});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить заказ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Название заказа'),
            ),
            TextField(
              controller: _statusController,
              decoration: const InputDecoration(labelText: 'Статус заказа'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Описание заказа'),
            ),
            ElevatedButton(
              onPressed: () {
                final newTask = Task(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  productionId: production.id,
                  title: _titleController.text,
                  status: _statusController.text,
                  description: _descriptionController.text,
                );
                Navigator.pop(context, newTask);
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
