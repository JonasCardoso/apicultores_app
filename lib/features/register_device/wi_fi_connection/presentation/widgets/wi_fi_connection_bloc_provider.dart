import 'package:apicultores_app/features/register_device/wi_fi_connection/business_logic/bloc/wi_fi_connection_bloc.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/business_logic/bloc/wi_fi_connection_bloc_repository.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WiFiConnectionBlocProvider extends StatelessWidget {
  const WiFiConnectionBlocProvider({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WiFiConnectionBloc>.value(
      value: WiFiConnectionBlocRepository().wiFiConnectionBloc,
      child: child,
    );
  }
}
