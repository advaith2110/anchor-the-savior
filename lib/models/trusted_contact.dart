class TrustedContact {
  final String name;
  final String phone;
  final String message;

  TrustedContact({
    required this.name,
    required this.phone,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'message': message,
      };

  factory TrustedContact.fromJson(Map<String, dynamic> json) {
    return TrustedContact(
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );
  }
}
