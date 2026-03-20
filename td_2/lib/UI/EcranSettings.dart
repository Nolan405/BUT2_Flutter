import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import '../repository/shared.dart';
import '../theme/mytheme.dart';


class EcranSettings extends StatefulWidget {
  const EcranSettings({Key? key}) : super(key: key);

  @override
  State<EcranSettings> createState() => _EcranSettingsState();
}

class _EcranSettingsState extends State<EcranSettings> {
  bool _dark = true;

  Future<void> _loadSettings() async{
    bool settings = await SettingRepository().getSettings();
    setState(() {
      _dark = settings;
    });
  }


  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SettingsList(
        darkTheme: SettingsThemeData(
          settingsListBackground: MyTheme
              .dark()
              .scaffoldBackgroundColor,
          settingsSectionBackground: MyTheme
              .dark()
              .scaffoldBackgroundColor,
        ),
        lightTheme: SettingsThemeData(
          settingsListBackground: MyTheme
              .light()
              .scaffoldBackgroundColor,
          settingsSectionBackground: MyTheme
              .light()
              .scaffoldBackgroundColor,
        ),
        sections: [
          SettingsSection(
            title: const Text('Theme'),
            tiles: [
              SettingsTile.switchTile(
                initialValue: _dark,
                onToggle: _onToggle,
                title: const Text('Dark mode'),
                leading: const Icon(Icons.invert_colors),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onToggle(bool value) {
    debugPrint('value $value');
    setState(() {
      _dark = value;
      SettingRepository().saveSettings(_dark);
    });
  }
}