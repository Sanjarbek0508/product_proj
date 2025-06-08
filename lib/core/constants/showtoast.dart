import 'package:flutter/material.dart';
import 'package:product_project/core/constants/routing.dart';
import 'package:toastification/toastification.dart';

class ShowToast {
  static const int _closeDuration = 3;

  static BuildContext get _context {
    final ctx = AppRouter.navigatorKey.currentContext;
    if (ctx == null) throw Exception('Context is not available.');
    return ctx;
  }

  static void error2(String message) {
    toastification.show(
      type: ToastificationType.error,
      context: _context,
      showProgressBar: false,
      title: Text(message),
      dragToClose: true,
      autoCloseDuration: const Duration(seconds: _closeDuration),
    );
  }

  static void error(BuildContext context, String message) {
    toastification.show(
      type: ToastificationType.error,
      context: context,
      showProgressBar: false,
      title: Text(message),
      dragToClose: true,
      autoCloseDuration: const Duration(seconds: _closeDuration),
    );
  }

  static void warning(BuildContext context, String message) {
    toastification.show(
      type: ToastificationType.warning,
      context: context,
      dragToClose: true,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: _closeDuration),
    );
  }

  static void success(BuildContext context, String message) {
    toastification.show(
      type: ToastificationType.success,
      dragToClose: true,
      context: context,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: _closeDuration),
    );
  }

  static void bottom(BuildContext context, String message) {
    toastification.show(
      type: ToastificationType.success,
      dragToClose: true,
      alignment: Alignment.bottomCenter,
      context: context,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: _closeDuration),
    );
  }

  static void info(BuildContext context, String message) {
    toastification.show(
      type: ToastificationType.info,
      dragToClose: true,
      context: context,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: _closeDuration),
    );
  }
}
