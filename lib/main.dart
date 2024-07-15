import 'package:apicultores_app/app/apicultores_app.dart';
import 'package:apicultores_app/app/app_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await initializeDateFormatting('pt_BR', null);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ModularApp(
      module: AppModule(),
      child: const ApicultoresAppWidget(),
    ),
  );
}
