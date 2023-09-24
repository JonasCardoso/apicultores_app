import 'package:apicultores_app/features/devices/find_new_devices/presentation/bloc/find_new_devices_bloc/find_new_devices_bloc.dart';
import 'package:apicultores_app/shared/widgets/error_feed_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindNewDevicesErrorWidget extends StatelessWidget {
  const FindNewDevicesErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ErrorFeedBackWidget(
      onButtonClick: () {
        BlocProvider.of<FindNewDevicesBloc>(context).add(
          FindNewDevicesBluetoothStateChecked(),
        );
      },
    );
  }
}
