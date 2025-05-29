class RemedyDetailsModel {
  String? name;
  String? description;
  List<String>? symptoms;
  String? image;
  List<String>? keywords;
  List<String>? related;
  List<String>? forCondition; // 'for' is reserved, so renamed
  String? category;
  List<String>? properties;
  List<String>? chakras;
  String? element;

  RemedyDetailsModel({
    this.name,
    this.description,
    this.symptoms,
    this.image,
    this.keywords,
    this.related,
    this.forCondition,
    this.category,
    this.properties,
    this.chakras,
    this.element,
  });

  factory RemedyDetailsModel.fromJson(Map<String, dynamic> json) {
    return RemedyDetailsModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      symptoms:
          (json['symptoms'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList(),
      image: json['image'] as String?,
      keywords:
          (json['keywords'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList(),
      related:
          (json['related'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList(),
      forCondition:
          (json['for'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      category: json['category'] as String?,
      properties:
          (json['properties'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList(),
      chakras:
          (json['chakras'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList(),
      element: json['element'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'symptoms': symptoms,
      'image': image,
      'keywords': keywords,
      'related': related,
      'for': forCondition,
      'category': category,
      'properties': properties,
      'chakras': chakras,
      'element': element,
    };
  }
}
