import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

enum LogLevel {
  debug,
  info,
  warning,
  error,
}

@module
abstract class AppLogger {
  @singleton
  Logger provideLogger() {
    Logger logger = Logger();
    return logger;
  }
}
