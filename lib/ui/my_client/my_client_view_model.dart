import 'package:lightweaver/core/others/base_view_model.dart';

class MyClientViewModel extends BaseViewModel {
  String selectedAgeGroup = 'Age Group';
  String selectedVisit = 'Last Visit';

  final List<String> ageGroups = [
    'Age Group',
    '18-25',
    '26-35',
    '36-45',
    '46+',
  ];
  final List<String> visitFilters = [
    'Last Visit',
    'Newest First',
    'Oldest First',
  ];

  final List<Map<String, dynamic>> clients = [
    {
      "name": "Ayesha Khan",
      "age": 32,
      "gender": "Female",
      "lastSession": "3 Apr 2025",
    },
    {
      "name": "Ayesha Khan",
      "age": 32,
      "gender": "Female",
      "lastSession": "3 Apr 2025",
    },
    {
      "name": "Ayesha Khan",
      "age": 32,
      "gender": "Female",
      "lastSession": "3 Apr 2025",
    },
  ];
}
