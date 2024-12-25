import 'package:flutter/material.dart';
import 'package:rgr_app/task.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  final Function(Task) onTaskUpdated;

  EditTaskScreen({required this.task, required this.onTaskUpdated});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _statusController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _statusController = TextEditingController(text: widget.task.status);
    _descriptionController =
        TextEditingController(text: widget.task.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактировать заказ'),
      ),
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
                Task updatedTask = Task(
                  id: widget.task.id,
                  productionId: widget.task.productionId,
                  title: _titleController.text,
                  status: _statusController.text,
                  description: _descriptionController.text,
                );

                widget.onTaskUpdated(updatedTask);
                Navigator.pop(context);
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
