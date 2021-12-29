import 'package:flutter/material.dart';
import 'package:longoi_dot_ulun_kristian/provider/theme_provider.dart';
import 'package:longoi_dot_ulun_kristian/screens/about_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/home_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/settings_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_content_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_hymn_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_liturgy_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/view_notation_screen.dart';
import 'package:longoi_dot_ulun_kristian/utility/connectivity_service.dart';
import 'package:longoi_dot_ulun_kristian/utility/prefs.dart';
import 'package:provider/provider.dart';

import 'database/app_database.dart';
import 'database/daos_notifier/hymns_provider.dart';
import 'database/daos_notifier/liturgies_notifier.dart';
import 'database/daos_notifier/others_provider.dart';
import 'database/daos_notifier/prayers_provider.dart';
import 'database/daos_notifier/psalms_provider.dart';
import 'models/models_notifier/active_list_provider.dart';

Future<void> main() async {
  // Required for async calls in `main`
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPrefs instance.
  await SharedPrefs.init();
  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>(
          create: (context) => AppDatabase(),
          dispose: (context, db) => db.close(),
        ),
        ChangeNotifierProvider(create: (context) => ThemeProvider(context)),
      ],
      child: const HymnApp(),
    ),
  );
}

class HymnApp extends StatelessWidget {
  const HymnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (context) =>
              ConnectivityService().connectionStatusController.stream,
          initialData: ConnectivityStatus.offline,
        ),
        ChangeNotifierProvider(create: (context) => HymnsProvider(context)),
        ChangeNotifierProvider(create: (context) => OthersProvider(context)),
        ChangeNotifierProvider(create: (context) => PrayersProvider(context)),
        ChangeNotifierProvider(create: (context) => LiturgiesProvider(context)),
        ChangeNotifierProvider(create: (context) => PsalmsProvider(context)),
        ChangeNotifierProvider(create: (context) => ActiveListProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesOnlyProvider()),
        ChangeNotifierProvider(create: (context) => FilteredOnlyProvider()),
        ChangeNotifierProvider(create: (context) => ListGridProvider()),
        ChangeNotifierProvider(create: (context) => ListTextSizeProvider()),
        ChangeNotifierProvider(create: (context) => AlwaysAwakeProvider()),
      ],
      child: MaterialApp(
        theme:
            isDarkMode ? themeProvider.setToDark() : themeProvider.setToLight(),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          ViewContentScreen.id: (context) => const ViewContentScreen(),
          ViewHymnScreen.id: (context) => const ViewHymnScreen(),
          ViewNotationScreen.id: (context) => const ViewNotationScreen(),
          ViewLiturgyScreen.id: (context) => const ViewLiturgyScreen(),
          SettingsScreen.id: (context) => const SettingsScreen(),
          AboutScreen.id: (context) => const AboutScreen(),
        },
      ),
    );
  }
}
