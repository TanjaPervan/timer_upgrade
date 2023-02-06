import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:tanja_timer/injection_container.dart';
import 'package:tanja_timer/providers/app_provider.dart';
import 'package:tanja_timer/services/appearance_service.dart';
import 'package:tanja_timer/services/router_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  EasyLocalization.logger.enableLevels = [LevelMessages.info, LevelMessages.warning, LevelMessages.error];
  await EasyLocalization.ensureInitialized();

  initKiwi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = KiwiContainer().resolve<AppearanceService>().buildTheme();

    return EasyLocalization(
      supportedLocales: const [Locale('en')],
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      path: 'assets/localization',
      child: ChangeNotifierProvider<AppProvider>(
        create: (context) => AppProvider(),
        child: Consumer<AppProvider>(
          builder: (context, appProvider, child) {
            final router = KiwiContainer().resolve<RouterService>().router;
            return MaterialApp.router(
              title: 'Timer',
              theme: themeData,
              routerDelegate: router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
