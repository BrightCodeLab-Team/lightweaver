import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/core/model/remedy_details.dart';
import 'package:lightweaver/core/others/base_view_model.dart';

class RemedyDetailsViewModel extends BaseViewModel {
  int _selectedQuickLinkIndex = 0;

  int get selectedQuickLinkIndex => _selectedQuickLinkIndex;

  void selectQuickLink(int index) {
    _selectedQuickLinkIndex = index;
    notifyListeners();
  }

  ///
  ///
  ///
  List<String> quickLinkTitles = [
    'All',
    'Category',
    'Property',
    'Vibration',
    'Use',
  ];

  int selectedTabIndex = 0;

  void selectTabFunction(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  ///
  ///      remedy details card
  ///
  int selectedCardIndex = 0;

  void selectCard(int index) {
    selectedCardIndex = index;
    notifyListeners();
  }

  ///
  List<RemedyModel> remedyList = [
    RemedyModel(
      imageUrl: AppAssets().profile,
      title: 'Rock Rose',
      uses: ['Panic', 'SHock'],
      keywords: ['fear', 'OverWhelm'],
    ),
    RemedyModel(
      imageUrl: AppAssets().profile,
      title: 'Mimulus',
      uses: ['Panic', 'SHock'],
      keywords: ['fear', 'OverWhelm'],
    ),
    RemedyModel(
      imageUrl: AppAssets().profile,
      title: 'Cherry Plum',
      uses: ['Panic', 'SHock'],
      keywords: ['fear', 'OverWhelm'],
    ),
    RemedyModel(
      imageUrl: AppAssets().profile,
      title: 'Aspen',
      uses: ['Panic', 'SHock'],
      keywords: ['fear', 'OverWhelm'],
    ),
    RemedyModel(
      imageUrl: AppAssets().profile,
      title: 'Red Chestnut',
      uses: ['Panic', 'SHock'],
      keywords: ['fear', 'OverWhelm'],
    ),
    RemedyModel(
      imageUrl: AppAssets().profile,
      title: 'Rock Rose',
      uses: ['Panic', 'SHock'],
      keywords: ['fear', 'OverWhelm'],
    ),
    RemedyModel(
      imageUrl: AppAssets().profile,
      title: 'Rock Rose',
      uses: ['Panic', 'SHock'],
      keywords: ['fear', 'OverWhelm'],
    ),
  ];
}
