import 'package:flutter/material.dart';
import 'package:lightweaver/ui/my_client/my_client_view_model.dart';
import 'package:provider/provider.dart';

class MyClientScreen extends StatelessWidget {
  const MyClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyClientViewModel(),
      child: Consumer<MyClientViewModel>(
        builder:
            (context, model, child) =>
                Scaffold(body: Center(child: Text('my clients'))),
      ),
    );
  }
}
