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
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<void> sendEmailUsingEmailJS({
    required String name,
    required String email,
    required String message,
  }) async {
    const serviceId = 'service_prr6anp';
    const templateId = 'template_e7e9aud'; // Replace with your template ID
    const userId = 'bEn5MsbL6D3Fzte-F'; // Replace with your EmailJS Public Key

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'message': message,
        },
      }),
    );

    if (response.statusCode == 200) {
      print('✅ Email sent successfully');
      customSnackbar(title: "Email Sent", message: "✅ Email sent successfully");
    } else {
      print('❌ Failed to send email: ${response.body}');
    }
  }

  // Future<void> sendFormulaToClientViaEmail() async {
  //   if (_selectedClient?.email == null || _selectedClient!.email!.isEmpty) {
  //     customSnackbar(
  //       title: "Missing Client",
  //       message: "Please select a client with a valid email.",
  //     );
  //     return;
  //   }

  //   try {
  //     final callable = FirebaseFunctions.instance.httpsCallable(
  //       'sendFormulaEmail',
  //     );
  //     final result = await callable.call({
  //       "clientEmail": _selectedClient!.email!,
  //       "subject": "Your Custom Formula from Lightweaver",
  //       "formulaName": formulaModel.formulaName ?? "",
  //       "dosage": formulaModel.dosage ?? "",
  //       "notes": formulaModel.notes ?? "",
  //       "remedies":
  //           selectedRemedies.map((e) => {"name": e.name ?? ""}).toList(),
  //     });

  //     if (result.data["success"] == true) {
  //       customSnackbar(
  //         title: "Email Sent",
  //         message: "Formula sent to client successfully.",
  //       );
  //     } else {
  //       customSnackbar(
  //         title: "Failed to Send",
  //         message: result.data["error"] ?? "Unknown error occurred",
  //       );
  //     }
  //   } catch (e) {
  //     customSnackbar(title: "Error", message: "Error while sending email: $e");
  //     print("❌ sendFormulaToClientViaEmail error: $e");
  //   }
  // }
}
