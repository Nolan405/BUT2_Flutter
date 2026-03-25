import 'package:flutter/cupertino.dart';
import '../repository/shared.dart';

class SettingViewmodel extends ChangeNotifier {
  bool _isDark = false;
  final SettingRepository _settingRepository = SettingRepository();

  SettingViewmodel() {
    _init();
  }

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    _settingRepository.saveTheme(_isDark);
    notifyListeners();
  }

  void _init() async {
    _isDark = await _settingRepository.getTheme();
    notifyListeners();
  }
}