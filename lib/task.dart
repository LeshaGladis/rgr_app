class Task {
  String id;
  String productionId;
  String title;
  String status;
  String description; // Поле для описания задачи

  Task({
    required this.id,
    required this.productionId,
    required this.title,
    required this.status,
    required this.description, // Добавляем описание
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productionId': productionId,
      'title': title,
      'status': status,
      'description': description,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      productionId: map['productionId'],
      title: map['title'],
      status: map['status'],
      description: map['description'],
    );
  }
}
