import 'package:apicultores_app/features/devices/device_details/business_logic/bloc/device_details_bloc.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/widgets/device_details_form_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceDetailsEditButton extends StatelessWidget {
  const DeviceDetailsEditButton({
    super.key,
    required this.formModel,
    required this.formKey,
    required this.device,
  });
  final DeviceDetailsFormModel formModel;
  final LocalBeeDeviceEntity device;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Button(
      label: 'Salvar alterações',
      fill: true,
      onPressed: device.status == LocalBeeDeviceStatus.connected
          ? () {
              if (formKey.currentState!.validate()) {
                context.read<DeviceDetailsBloc>().add(
                      DeviceDetailsUpdated(
                        device: BeeDeviceEntity(
                          id: device.device.id,
                          name: formModel.deviceName.value.text,
                          location: formModel.location.value,
                          frequencyOfSavingData: formModel.frequencyTime.value,
                          deviceIp: device.device.deviceIp,
                        ),
                      ),
                    );
              }
            }
          : null,
    );
  }
}
