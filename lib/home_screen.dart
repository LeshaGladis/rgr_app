import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rgr_app/task_screen.dart';
import 'package:rgr_app/production.dart';

class Screen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Screen({Key? key}) : super(key: key);

  Future<void> _createProduction(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final userId =
    prefs.getString('userId');

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пользователь не авторизован')),
      );
      return;
    }

    final String title = _titleController.text;
    final String description = _descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      final newProduction = Production(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: description,
        userId: userId,
      );

      print('Создано новое производство: ${newProduction.title}, ID: ${newProduction.id}');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TaskScreen(production: newProduction),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пожалуйста, заполните все поля')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Создать производство')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Название производства'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Описание производства'),
            ),
            ElevatedButton(
              onPressed: () => _createProduction(context),
              child: const Text('Сохранить производства'),
            ),
          ],
        ),
      ),
    );
  }
}
