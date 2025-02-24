import 'dart:io';
import 'package:logger/logger.dart';

class CustomLogger {
  late Logger _logger;
  final String logFilePath;

  CustomLogger({this.logFilePath = "logs.txt"}) {
    _logger = Logger(
      printer: PrettyPrinter(), // Formats log messages nicely
    );
  }

  void logDebug(String message) {
    _logger.d(message);
    _writeToFile("DEBUG: $message");
  }

  void logInfo(String message) {
    _logger.i(message);
    _writeToFile("INFO: $message");
  }

  void logWarning(String message) {
    _logger.w(message);
    _writeToFile("WARNING: $message");
  }

  void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
    _writeToFile("ERROR: $message");
  }

  void _writeToFile(String logMessage) {
    final logEntry = "${DateTime.now()} - $logMessage\n";
    final file = File(logFilePath);
    file.writeAsStringSync(logEntry, mode: FileMode.append, flush: true);
  }
}
