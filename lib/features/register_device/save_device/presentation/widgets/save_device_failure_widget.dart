import 'package:apicultores_app/features/register_device/save_device/business_logic/bloc/save_device_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/shared/widgets/error_feed_back_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveDeviceFailureWidget extends StatelessWidget {
  const SaveDeviceFailureWidget({
    super.key,
    required this.beeDeviceEntity,
  });
  final BeeDeviceEntity beeDeviceEntity;
  @override
  Widget build(BuildContext context) {
    return ErrorFeedBackWidget(
      errorType: ErrorType.connection,
      onButtonClick: () {
        context.read<SaveDeviceBloc>().add(
              SaveDeviceStarted(
                beeDeviceEntity: beeDeviceEntity,
              ),
            );
      },
    );
  }
}
