class SupportSession {
  final String id;
  final String mood;
  final String note;
  final DateTime createdAt;
  final String? copingStrategy;

  SupportSession({
    required this.id,
    required this.mood,
    required this.note,
    required this.createdAt,
    this.copingStrategy,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'mood': mood,
        'note': note,
        'createdAt': createdAt.toIso8601String(),
        'copingStrategy': copingStrategy,
      };

  factory SupportSession.fromJson(Map<String, dynamic> json) {
    return SupportSession(
      id: json['id'] as String? ?? '',
      mood: json['mood'] as String? ?? 'neutral',
      note: json['note'] as String? ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ?? DateTime.now(),
      copingStrategy: json['copingStrategy'] as String?,
    );
  }
}
