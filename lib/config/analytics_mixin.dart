import 'package:firebase_analytics/firebase_analytics.dart';

mixin GoogleAnalyticsMixin {
  static final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

  /// Basic method for Logging Custom Events
  void gaLogEvent({
    required String eventName,
    Map<String, Object>? eventValues,
  }) async {
    await firebaseAnalytics.logEvent(
      name: eventName,
      parameters: eventValues,
    );
  }

  /// Firebase Common Screen view Events for Analytics: Specifically for time measurement
  static Future<void> trackFirebaseScreenViewEvent({
    required String screenName,
    required String screenClass,
  }) async {
    await firebaseAnalytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );
  }
}
