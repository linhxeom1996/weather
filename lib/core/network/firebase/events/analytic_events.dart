import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

abstract class AnalyticEvent {
  Future eventShowRating();
  Future eventGoPremium();
}

@Singleton(as: AnalyticEvent)
class AnalyticEventImpl extends AnalyticEvent {
  static const String showRating = "show_rating";
  static const String goPremium = "go_premium";

  @override
  Future eventGoPremium() {
    return _sendEvent(goPremium);
  }

  @override
  Future eventShowRating() {
    return _sendEvent(showRating);
  }

  _sendEvent(String name, {Map<String, Object?>? data}) {
    FirebaseAnalytics.instance.logEvent(name: name, parameters: data);
  }
}
