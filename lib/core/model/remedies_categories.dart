import 'package:lightweaver/core/model/remedy_details.dart';

class RemedyCategoryModel {
  String? id;
  String? categoryName;
  List<RemedyDetailsModel>? remedies;

  RemedyCategoryModel({this.id, this.categoryName, this.remedies});

  factory RemedyCategoryModel.fromJson(Map<String, dynamic> json) {
    print(' ${json['categoryName']}');
    print(
      "is this null or not ===> remedies data ${json['remedies']}",
    ); // <-- Yeh dekhein ki yeh null hai ya empty ya valid list

    return RemedyCategoryModel(
      id: json['id'],
      categoryName: json['categoryName'],
      remedies:
          json['remedies'] != null
              ? json['remedies'] is List
                  ? (json['remedies'] as List)
                      .map(
                        (e) => RemedyDetailsModel.fromJson(
                          e as Map<String, dynamic>,
                        ),
                      )
                      .toList()
                  : json['remedies'] is Map
                  ? [
                    RemedyDetailsModel.fromJson(
                      json['remedies'] as Map<String, dynamic>,
                    ),
                  ]
                  : []
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryName': categoryName,
      'remedies': remedies?.map((x) => x.toJson()).toList(),
    };
  }
}
