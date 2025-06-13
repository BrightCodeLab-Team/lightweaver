class ClientProfile {
  String? name;
  int? age;
  String? gender;
  String? phone;
  String? email;
  String? date;
  String? notes;
  String? imagePath; // <-- New field

  ClientProfile({
    this.name,
    this.age,
    this.gender,
    this.phone,
    this.email,
    this.date,
    this.notes,
    this.imagePath, // <-- Include in constructor
  });

  factory ClientProfile.fromJson(Map<String, dynamic> json) {
    return ClientProfile(
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      date: json['date'] ?? '',
      notes: json['notes'] ?? '',
      imagePath: json['imagePath'] ?? '', // <-- From JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'phone': phone,
      'email': email,
      'date': date,
      'notes': notes,
      'imagePath': imagePath, // <-- To JSON
    };
  }
}
