import 'package:e_commerce_1/core/design_system/design_system.dart';
import 'package:e_commerce_1/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ).paddingHorizontal(AppSpacing.md),
        ),
      ),
    );
  }
}
