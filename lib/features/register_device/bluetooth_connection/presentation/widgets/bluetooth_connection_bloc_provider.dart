import 'package:apicultores_app/features/register_device/bluetooth_connection/business_logic/bloc/bluetooth_connection_bloc.dart';
import 'package:apicultores_app/features/register_device/bluetooth_connection/business_logic/use_case/bluetooth_connection_use_case.dart';
import 'package:apicultores_app/features/register_device/bluetooth_connection/data/repositories/bluetooth_connection_repository.dart';
import 'package:apicultores_app/features/register_device/shared/data/data_sources/bluetooth_data_source.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BluetoothConnectionBlocProvider extends StatelessWidget {
  const BluetoothConnectionBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BluetoothConnectionBloc>(
      create: (_) => BluetoothConnectionBloc(
        BluetoothConnectionUseCase(
          bluetoothConnectionRepository: BluetoothConnectionRepository(
            bluetoothDataSource: BluetoothDataSource(),
          ),
        ),
      )..add(
          BluetoothConnectionFetched(),
        ),
      child: child,
    );
  }
}
