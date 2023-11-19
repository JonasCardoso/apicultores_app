import 'package:apicultores_app/app/apicultores_app.dart';
import 'package:apicultores_app/app/app_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('pt_BR', null);
  runApp(
    ModularApp(
      module: AppModule(),
      child: const ApicultoresAppWidget(),
    ),
  );
}
