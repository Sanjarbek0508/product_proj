import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:product_project/core/services/token_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconButton(
            onPressed: () async {
              log(TokenStorage.accessToken.toString());
            },
            icon: Icon(
              Icons.abc,
            ),
          ),
        ],
      ),
    );
  }
}
