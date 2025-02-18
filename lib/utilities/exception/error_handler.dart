import 'package:flutter/material.dart';

abstract class AppError implements Exception {
  String get message;
}

class NetworkError extends AppError {
  @override
  final String message;
  NetworkError(this.message);
}

class DatabaseError extends AppError {
  @override
  final String message;
  DatabaseError(this.message);
}

class UnknownError extends AppError {
  @override
  final String message;
  UnknownError(this.message);
}

class ErrorHandler {
  static AppError handleException(dynamic error) {
    if (error is AppError) {
      return error;
    } else if (error is Exception) {
      return UnknownError(error.toString());
    } else {
      return UnknownError("Bilinmeyen bir hata oluştu");
    }
  }

  static void showErrorSnackBar(BuildContext context, AppError error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.message)));
  }
}
