import 'package:flutter/material.dart';
import 'package:lightweaver/ui/my_formulas/my_formulas_view_model.dart';
import 'package:provider/provider.dart';

class MyFormulasScreen extends StatelessWidget {
  const MyFormulasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyFormulasViewModel(),
      child: Consumer<MyFormulasViewModel>(
        builder:
            (context, model, child) =>
                Scaffold(body: Center(child: Text('my formulas'))),
      ),
    );
  }
}
