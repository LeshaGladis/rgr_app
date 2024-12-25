import 'package:flutter/material.dart';
import 'package:rgr_app/register_screen.dart';
import 'package:rgr_app/task_screen.dart';
import 'package:rgr_app/production.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Приложение для формирования заказов на производстве',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
    );
  }
}

class ProductionScreen extends StatelessWidget {
  ElevatedButton _buildButton(
      BuildContext context, String text, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главный экран'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(context, 'Перейти к регистрации', RegisterScreen()),
            const SizedBox(height: 10),
            _buildButton(
              context,
              'Перейти к заказам',
              TaskScreen(
                production: Production(
                  id: '1',
                  title: 'Демо производство',
                  description: 'Описание производства',
                  userId: '1',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
