import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rgr_app/production.dart';

class ProductionListScreen extends StatefulWidget {
  @override
  _ProductionListScreenState createState() => _ProductionListScreenState();
}

class _ProductionListScreenState extends State<ProductionListScreen> {
  List<Production> productions = [];

  Future<void> _loadProductions() async {
    final prefs = await SharedPreferences.getInstance();
    final userId =
    prefs.getString('userId');

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пользователь не авторизован')),
      );
      return;
    }

    setState(() {
      productions = [
        Production(
            id: '1',
            title: 'Производство 1',
            description: 'Описание производства 1',
            userId: userId),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProductions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мои производства')),
      body: ListView.builder(
        itemCount: productions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(productions[index].title),
            subtitle: Text(productions[index].description),
          );
        },
      ),
    );
  }
}
