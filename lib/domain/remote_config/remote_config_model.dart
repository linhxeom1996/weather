class IdAdEntity {
  String? bannerAdUnitId;
  List<String>? interstitialAdUnitId;
  List<String>? openAdUnitId;

  IdAdEntity(
      {this.bannerAdUnitId, this.interstitialAdUnitId, this.openAdUnitId});

  IdAdEntity.fromJson(Map<String, dynamic> json) {
    bannerAdUnitId = json['BANNER_AD_UNIT_ID_ANDROID'];
    interstitialAdUnitId =
        convertString(json['INTERSTITIAL_AD_UNIT_ID_ANDROID']);
    openAdUnitId = convertString(json['APP_OPEN_AD_UNIT_ID_ANDROID']);
  }

  List<String> convertString(String str) {
    return str
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .split(",")
        .map((e) => e.trim())
        .toList();
  }
}