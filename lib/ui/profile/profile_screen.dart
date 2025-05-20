import 'package:flutter/material.dart';
import 'package:lightweaver/ui/profile/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder:
            (context, model, child) =>
                Scaffold(body: Center(child: Text('Profile Screens'))),
      ),
    );
  }
}
