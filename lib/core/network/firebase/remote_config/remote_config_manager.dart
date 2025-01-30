import 'dart:convert';
import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'remote_config_domain.dart';



const String tag = "RemoteConfigService";

const String subscriptionOption = "subscription_option";
const String onShowAds = "on_show_ads";
const String countSession = "count_session";
const String idAds = "id_ads";

@singleton
class RemoteConfigService {
  late FirebaseRemoteConfig config;
  Map<String, dynamic> defaults = {};

  Future fetch() async {
    config = FirebaseRemoteConfig.instance;

    const defaultFile = "assets/jsons/remote_config.json";
    defaults = json.decode(await rootBundle.loadString(defaultFile));

    if (defaults.containsKey(subscriptionOption)) {
      defaults[subscriptionOption] = json.encode(defaults[subscriptionOption]);
    }

    if (defaults.containsKey(onShowAds)) {
      defaults[onShowAds] = json.encode(defaults[onShowAds]);
    }

    if (defaults.containsKey(countSession)) {
      defaults[countSession] = json.encode(defaults[countSession]);
    }

    if (defaults.containsKey(idAds)) {
      defaults[idAds] = json.encode(defaults[idAds]);
    }

    await config.setDefaults(defaults);
    await config.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 2)));

    try {
      await config.fetchAndActivate();
    } catch (e) {
      log(e.toString());
    }
  }

  bool get showAds {
    try {
      return config.getBool(onShowAds);
    } catch (e) {
      log("on show ad error: $e", name: tag);
    }
    return false;
  }

  int get getCountSession {
    try {
      return config.getInt(countSession);
    } catch (e) {
      log("count session error: $e", name: tag);
    }
    return 0;
  }

  IdAdEntity get idUnitId {
    try {
      final map = json.decode(config.getString(idAds)) as Map<String, dynamic>;
      final service = <String, dynamic>{};
      map.forEach((key, value) {
        service[key] = value.toString();
      });
      return IdAdEntity.fromJson(service);
    } catch (_) {}
    return IdAdEntity.fromJson({});
  }
}
