class Production {
  String id;
  String title;
  String description;
  String userId;

  Production({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'userId': userId,
    };
  }

  static Production fromMap(Map<String, dynamic> map) {
    return Production(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      userId: map['userId'],
    );
  }
}