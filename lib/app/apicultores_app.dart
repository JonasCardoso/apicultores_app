import 'package:design_system/design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ApicultoresAppWidget extends StatelessWidget {
  const ApicultoresAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Apicultores App',
      theme: MyTheme.themeData,
      routerConfig: Modular.routerConfig,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'), // Portuguese, Brazil
      ],
    );
  }
}
