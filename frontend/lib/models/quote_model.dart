class Quote {
  final String text;
  final String date;

  Quote({required this.text, required this.date});

  factory Quote.fromMap(Map<String, dynamic> data, String docId) {
    return Quote(
      text: data['text'] ?? '',
      date: docId,
    );
  }
}
