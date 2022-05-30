// Package imports:
import 'package:copy_tokopedia/core.dart';
import 'package:sentry/sentry.dart';

bool get isInDebugMode {
  // Assume you're in production mode.
  // bool inDebugMode = APP_DEV;
  bool inDebugMode = false;

  // Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
  // assert(inDebugMode = true);

  return inDebugMode;
}

Future<void> reportError(dynamic error, dynamic stackTrace) async {
  // Print the exception to the console.
  // debugPrint('Caught error: $error');
  if (isInDebugMode) {
    // Print the full stacktrace in debug mode.
    // debugPrint(stackTrace);
    // debugPrint('In dev mode. Not sending report to Sentry.io.');
    return;
  } else {
    debugPrint('Reporting to Sentry.io...');
    await Sentry.captureException(
      error,
      stackTrace: stackTrace,
    );

    // debugPrint(response);
  }
}
