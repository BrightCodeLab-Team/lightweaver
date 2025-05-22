class AppUser {
  String? id;
  String? name;
  String? email;
  String? password;
  String? practitionerType;
  String? country;

  AppUser({
    this.id,
    this.name,
    this.email,
    this.password,
    this.practitionerType,
    this.country,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      practitionerType: json['practitionerType'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'practitionerType': practitionerType,
      'country': country,
    };
  }
}
