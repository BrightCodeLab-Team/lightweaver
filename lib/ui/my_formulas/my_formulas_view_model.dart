import 'package:get/route_manager.dart';
import 'package:lightweaver/core/enums/view_state_model.dart';
import 'package:lightweaver/core/model/cleint_profile.dart';
import 'package:lightweaver/core/model/formula_model.dart';
import 'package:lightweaver/core/model/remedies_categories.dart';
import 'package:lightweaver/core/model/remedy_details.dart';
import 'package:lightweaver/core/others/base_view_model.dart';
import 'package:lightweaver/core/services/db_services.dart';
import 'package:lightweaver/custom_widget/snack_bar/custom_snack_bar.dart';
import 'package:lightweaver/locator.dart';
import 'package:lightweaver/ui/my_formulas/myformula_detail/my_formula_details_screen.dart';

class MyFormulasViewModel extends BaseViewModel {
  final _db = locator<DatabaseServices>();

  List<RemedyCategoryModel> _categories = [];
  List<RemedyCategoryModel> get categories => _categories;
  List<RemedyDetailsModel> _filteredRemedies = [];
  List<RemedyDetailsModel> get filteredRemedies => _filteredRemedies;
  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  FormulaModel formulaModel = FormulaModel();

  MyFormulasViewModel() {
    getRemedies();
    getClients();
  }

  List<RemedyDetailsModel> selectedRemedies = [];

  void toggleRemedySelection(RemedyDetailsModel remedy) {
    if (selectedRemedies.contains(remedy)) {
      selectedRemedies.remove(remedy);
    } else {
      selectedRemedies.add(remedy);
    }
    notifyListeners();
  }

  Future<void> saveFormula() async {
    if ((formulaModel.formulaName?.trim().isEmpty ?? true)) {
      customSnackbar(
        title: "Missing Name",
        message: "Please enter a formula name.",
      );
      return;
    }

    if (selectedRemedies.isEmpty) {
      customSnackbar(
        title: "No Remedies",
        message: "Please select at least one remedy to proceed.",
      );
      return;
    }

    // Set selected remedies before saving
    formulaModel.remedies = selectedRemedies;

    setState(ViewState.busy);

    final success = await _db.saveFormula(formulaModel);

    if (success) {
      print("✅ Formula saved!");
      selectedRemedies.clear();
      formulaModel = FormulaModel(); // Reset the model
      Get.to(() => MyFormulaDetailsScreen());
      customSnackbar(
        title: "Success",
        message: "The formula was saved successfully.",
      );
    } else {
      print("❌ Failed to save formula.");
      customSnackbar(
        title: "Failed",
        message: "An error occurred while saving the formula.",
      );
    }

    setState(ViewState.idle);
    notifyListeners();
  }

  /// Load remedy categories and remedies
  Future<void> getRemedies() async {
    setState(ViewState.busy);

    try {
      final allCategories = await _db.getRemedyCategories();
      _categories = allCategories;
    } catch (e) {
      print("Error loading remedies: $e");
    }

    setState(ViewState.idle);
  }

  /// Select remedy by flat list index
  void selectRemedy(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  /// Flattened list of all remedies across categories
  List<RemedyDetailsModel> get allRemediesFlat {
    return _categories
        .expand((category) => category.remedies ?? <RemedyDetailsModel>[])
        .toList();
  }

  /// Optional: Get selected remedy
  RemedyDetailsModel? get selectedRemedy {
    if (_selectedIndex < 0 || _selectedIndex >= allRemediesFlat.length) {
      return null;
    }
    return allRemediesFlat[_selectedIndex];
  }

  void searchRemedies(String query) {
    _searchQuery = query;

    if (query.isEmpty) {
      _filteredRemedies = [];
    } else {
      final lowerQuery = query.toLowerCase();
      _filteredRemedies =
          allRemediesFlat
              .where(
                (remedy) =>
                    remedy.name?.toLowerCase().contains(lowerQuery) ?? false,
              )
              .toList();
    }

    notifyListeners();
  }

  RemedyDetailsModel? get selectedFilteredRemedy {
    if (_selectedIndex < 0 || _selectedIndex >= filteredRemedies.length) {
      return null;
    }
    return filteredRemedies[_selectedIndex];
  }

  List<ClientProfile> _clients = [];
  List<ClientProfile> get clients => _clients;

  ClientProfile? _selectedClient;
  ClientProfile? get selectedClient => _selectedClient;

  set selectedClient(ClientProfile? value) {
    _selectedClient = value;
    notifyListeners();
  }

  Future<void> getClients() async {
    try {
      _clients = await _db.getAllClientProfiles();
      notifyListeners();
    } catch (e) {
      print("Error fetching clients: $e");
    }
  }
}
