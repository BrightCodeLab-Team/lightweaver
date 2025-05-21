import 'package:flutter/material.dart';
import 'package:lightweaver/core/constants/text_style.dart';
import 'package:lightweaver/ui/setting/setting_view_model.dart';
import 'package:provider/provider.dart';

class EmailTemplateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingViewModel(),
      child: Consumer<SettingViewModel>(
        builder:
            (context, model, child) => Scaffold(
              ///
              /// Start Body
              ///
              body: Center(
                child: Text("Email Template Screen", style: style25B),
              ),
            ),
      ),
    );
  }
}
