import 'dart:io';
import 'package:baseApp/generated/l10n.dart';
import 'package:baseApp/routers/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioErrorHandler {
  static void handleError(DioException e) {
    String errorMessage = _getErrorMessage(e);
    _showSnackBar(errorMessage);
  }

  static String _getErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return S.current.connectionTimeout;
      case DioExceptionType.sendTimeout:
        return S.current.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return S.current.receiveTimeout;
      case DioExceptionType.badResponse:
        return S.current.badResponse;
      case DioExceptionType.connectionError:
        return S.current.connectionError;
      case DioExceptionType.unknown:
        if (e.error == null) {
          return S.current.connectionError;
        } else if (e.error is SocketException) {
          return S.current.connectionError;
        } else {
          return S.current.unknown;
        }
      case DioExceptionType.badCertificate:
        return S.current.badCertificate;
      case DioExceptionType.cancel:
        return S.current.requestCanceled;
    }
  }

  static void _showSnackBar(String message) {
    ScaffoldMessenger.of(AppRouteName.navigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
