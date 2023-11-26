import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

abstract class LocalStorage {
  Future<void> init();

  bool get isFirstOpen;

  void setIsFirstOpen();

  List<String> get historySearch;

  void setHistorySearch(List<String> list);
}

@Singleton(as: LocalStorage)
class LocalStorageImpl extends LocalStorage {
  static const _kPrefBoxName = 'kPrefBoxName';
  static const _isFirstOpen = 'isFirstOpen';
  static const _historySearch = "historySearch";

  Box? box;

  @override
  Future<void> init() async {
    final dir = await getApplicationSupportDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox(_kPrefBoxName);
    return;
  }

  @override
  bool get isFirstOpen => box?.get(_isFirstOpen) ?? true;

  @override
  void setIsFirstOpen() {
    box?.put(_isFirstOpen, false);
  }

  @override
  List<String> get historySearch => box?.get(_historySearch) ?? [];

  @override
  void setHistorySearch(List<String> list) {
    box?.put(_historySearch, list);
  }
}
