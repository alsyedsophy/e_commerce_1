import 'package:flutter/foundation.dart';

/// Minimal logging abstraction.
///
/// Implementations decide where messages go. Sensitive data (passwords,
/// tokens, personal information) must never be passed to these methods.
abstract class LoggerService {
  void debug(String message);
  void info(String message);
  void warning(String message);
  void error(String message, [Object? error, StackTrace? stackTrace]);
}

/// Default logger that routes through [debugPrint].
///
/// For production, replace this with a service that forwards to Crashlytics
/// or another aggregator; unexpected exceptions should be reported, expected
/// business failures should not.
class AppLogger implements LoggerService {
  @override
  void debug(String message) => debugPrint('[DEBUG] $message');

  @override
  void info(String message) => debugPrint('[INFO] $message');

  @override
  void warning(String message) => debugPrint('[WARN] $message');

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    debugPrint('[ERROR] $message');
    if (error != null) {
      debugPrint(error.toString());
    }
  }
}
