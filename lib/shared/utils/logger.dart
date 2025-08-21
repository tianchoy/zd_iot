import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  AppLogger._();
  static final AppLogger instance = AppLogger._();

  final Map<String, Logger> _loggers = {};

  Logger _getLogger([String? tag]) {
    final loggerTag = tag ?? 'App';
    if (!_loggers.containsKey(loggerTag)) {
      _loggers[loggerTag] = Logger(
        level: _getLogLevel(),
        printer: PrettyPrinter(
          methodCount: kDebugMode ? 2 : 0,
          errorMethodCount: 8,
          lineLength: 120,
          colors: kDebugMode,
          printEmojis: true,
          printTime: true,
        ),
      );
    }
    return _loggers[loggerTag]!;
  }

  Level _getLogLevel() {
    if (kDebugMode) {
      return Level.verbose;
    } else if (kProfileMode) {
      return Level.info;
    } else {
      return Level.warning;
    }
  }

  // 所有方法保持命名参数风格
  void d(
    dynamic message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;
    _getLogger(tag).d(message, error: error, stackTrace: stackTrace);
  }

  void i(
    dynamic message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _getLogger(tag).i(message, error: error, stackTrace: stackTrace);
  }

  void w(
    dynamic message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _getLogger(tag).w(message, error: error, stackTrace: stackTrace);
  }

  void e(
    dynamic message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _getLogger(tag).e(message, error: error, stackTrace: stackTrace);
  }

  // wtf方法使用位置参数（与Logger库保持一致）
  void wtf(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
    String? tag,
  ]) {
    _getLogger(tag).wtf(message, error: error, stackTrace: stackTrace);
  }

  void apiRequest(
    String method,
    String url, {
    dynamic body,
    Map<String, String>? headers,
    String? tag,
  }) {
    final logTag = tag ?? 'API';
    final logMessage =
        '[$method] $url\n'
        'Headers: ${headers ?? '{}'}\n'
        'Body: ${body ?? '{}'}';

    i(logMessage, tag: logTag);
  }

  void apiResponse(
    String method,
    String url,
    int statusCode, {
    dynamic body,
    String? tag,
    Duration? duration,
  }) {
    final logTag = tag ?? 'API';
    final durationStr = duration != null
        ? '耗时: ${duration.inMilliseconds}ms'
        : '';
    final logMessage =
        '[$method] $url | $statusCode $durationStr\n'
        'Response: ${body ?? '{}'}';

    if (statusCode >= 200 && statusCode < 300) {
      i(logMessage, tag: logTag);
    } else {
      w(logMessage, tag: logTag);
    }
  }
}

final logger = AppLogger.instance;
