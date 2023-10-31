import 'package:apicultores_app/features/register_device/save_device/business_logic/bloc/save_device_bloc.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/navigation/save_device_navigation_delegate.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/widgets/save_device_failure_widget.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/widgets/save_device_form_widget/save_device_form_widget.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/widgets/save_device_success_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveDeviceScreenBuilder extends StatelessWidget {
  const SaveDeviceScreenBuilder({
    super.key,
    required this.deviceIp,
    required this.navigationDelegate,
  });
  final String deviceIp;
  final SaveDeviceNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveDeviceBloc, SaveDeviceState>(
        builder: (context, state) => switch (state) {
              SaveDeviceInitial _ => SaveDeviceFormWidget(
                  deviceIp: deviceIp,
                ),
              SaveDeviceLoading _ => const Center(
                  child: CircularProgressIndicator(),
                ),
              SaveDeviceSuccess _ => SaveDeviceSuccessWidget(
                  navigationDelegate: navigationDelegate,
                ),
              SaveDeviceFailure state => SaveDeviceFailureWidget(
                  beeDeviceEntity: state.beeDeviceEntity,
                ),
            });
  }
}
