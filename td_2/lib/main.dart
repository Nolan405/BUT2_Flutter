import 'package:dev_mobile/theme/mytheme.dart';
import 'package:dev_mobile/viewModel/TaskViewModel.dart';
import 'package:dev_mobile/viewModel/settingViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SettingViewmodel()),
          ChangeNotifierProvider(create: (context) => TaskViewModel()..generateTasks()),
        ],
        child: Builder(
          builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "TD2",
            theme: context.watch<SettingViewmodel>().isDark ? MyTheme.dark() : MyTheme.light(),
            home: const MyApp(),
          ),
        ),
      ),
  );
}