import 'package:logger/logger.dart';

class DebugModel {
  static final DebugModel _debug = DebugModel._internal();
  // Logger.level = Level.info;
  var logger = Logger(
    level: Level.info,
    printer: PrettyPrinter(
        methodCount: 3, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );

  factory DebugModel() {
    return _debug;
  }
  DebugModel._internal();
}
