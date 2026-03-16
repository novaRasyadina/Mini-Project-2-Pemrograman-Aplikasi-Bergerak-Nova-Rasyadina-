class Journal {
  final String? id;
  final String title;
  final String date;
  final String content;
  final String mood;
  final String? userId;

  Journal({
    this.id,
    required this.title,
    required this.date,
    required this.content,
    this.mood = '😊',
    this.userId,
  });

  factory Journal.fromMap(Map<String, dynamic> map) {
    return Journal(
      id: map['id']?.toString(),
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      content: map['content'] ?? '',
      mood: map['mood'] ?? '😊',
      userId: map['user_id']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'content': content,
      'mood': mood,
      'user_id': userId,
    };
  }
}