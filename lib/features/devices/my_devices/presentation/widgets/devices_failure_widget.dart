import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/shared/widgets/error_feed_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesFailureWidget extends StatelessWidget {
  const DevicesFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ErrorFeedBackWidget(onButtonClick: () {
      context.read<MyDevicesBloc>().add(const MyDevicesFetched());
    });
  }
}
