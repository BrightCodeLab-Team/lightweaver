import 'package:lightweaver/core/model/remedy_details.dart';

class FormulaModel {
  String? formulaName;
  String? clientName;
  String? dosage;
  String? notes;
  List<RemedyDetailsModel>? remedies;
  String? createdAt; // <-- Add this

  FormulaModel({
    this.formulaName,
    this.clientName,
    this.dosage,
    this.notes,
    this.remedies,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'formulaName': formulaName,
      'client': clientName,
      'dosage': dosage,
      'notes': notes,
      'remedies': remedies?.map((r) => r.toJson()).toList(),
      'createdAt': createdAt ?? DateTime.now().toIso8601String(),
    };
  }

  factory FormulaModel.fromJson(Map<String, dynamic> json) {
    return FormulaModel(
      formulaName: json['formulaName'] as String?,
      clientName: json['client'] as String?,
      dosage: json['dosage'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] as String?, // <-- Parse it
      remedies:
          (json['remedies'] as List<dynamic>?)
              ?.map((item) => RemedyDetailsModel.fromJson(item))
              .toList(),
    );
  }
}
