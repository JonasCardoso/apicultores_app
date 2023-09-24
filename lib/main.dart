import 'package:apicultores_app/app/apicultores_app.dart';
import 'package:apicultores_app/app/app_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const ApicultoresAppWidget(),
    ),
  );
}
