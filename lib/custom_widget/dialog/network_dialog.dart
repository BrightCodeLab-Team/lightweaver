// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class NetworkErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Network Error'),
      content: Text("Connect the Network"),
    );
  }
}
