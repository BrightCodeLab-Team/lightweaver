class SignUpModel {
  final String name;
  final String email;
  final String practitionerType;
  final String country;

  SignUpModel({
    required this.name,
    required this.email,
    required this.practitionerType,
    required this.country,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      practitionerType: json['practitionerType'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'practitionerType': practitionerType,
      'country': country,
    };
  }
}
