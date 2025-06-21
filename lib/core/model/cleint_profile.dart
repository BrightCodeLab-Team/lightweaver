class ClientProfile {
  String? id;
  String? name;
  int? age;
  String? gender;
  String? phone;
  String? email;
  String? dateOfBirth;
  String? notes;
  String? imagePath;
  // When the profile was created internally
  DateTime? createdAt;

  ClientProfile({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.phone,
    this.email,
    this.dateOfBirth,
    this.createdAt,
    this.notes,
    this.imagePath,
  });

  factory ClientProfile.fromJson(Map<String, dynamic> json) {
    return ClientProfile(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      phone: json['phone'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      notes: json['notes'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'phone': phone,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'createdAt': createdAt?.toIso8601String(),
      'notes': notes,
      'imagePath': imagePath,
    };
  }
}
