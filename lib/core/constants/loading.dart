import 'package:flutter/material.dart';

class AppLoadingScreen extends StatelessWidget {
  final EdgeInsets? padding;

  const AppLoadingScreen({this.padding = EdgeInsets.zero, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: SizedBox(
          height: 48,
          width: 48,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            color: Colors.green
          ),
        ),
      ),
    );
  }
}

showAppLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AppLoadingScreen(padding: EdgeInsets.all(100));
    },
  );
}

void loading(BuildContext context) => showAppLoadingDialog(context);
