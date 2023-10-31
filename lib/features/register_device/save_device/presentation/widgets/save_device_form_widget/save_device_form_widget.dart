import 'package:apicultores_app/features/devices/my_devices/data/dtos/enums/bee_frequency_time_unit.dart';
import 'package:apicultores_app/features/register_device/save_device/business_logic/bloc/save_device_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_frequency_saving_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_location_entity.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/navigation/save_device_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'save_device_text_field.dart';
part 'save_device_locale.dart';
part 'save_device_update_time.dart';
part 'save_device_form_helper_widgets.dart';

class SaveDeviceFormWidget extends StatelessWidget {
  SaveDeviceFormWidget({
    super.key,
    required this.deviceIp,
  });
  final String deviceIp;
  final TextEditingController deviceNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final locationInformation = _LocationInformation();
  final frequencyTime = _FrequencyTime();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: Spacing.xlarge,
              ),
              _SaveDeviceNameForm(
                controller: deviceNameController,
              ),
              const SizedBox(
                height: Spacing.xlarge,
              ),
              _SaveDeviceLocale(
                locationInformation: locationInformation,
              ),
              const SizedBox(
                height: Spacing.xlarge,
              ),
              _SaveDeviceUpdateTime(
                frequencyTime: frequencyTime,
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Button(
          label: Strings.saveDeviceFormButton,
          onPressed: () {
            buildBeeDevice(context);
          },
          fill: true,
        ),
      ],
    );
  }

  void buildBeeDevice(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final beeDevice = BeeDeviceEntity(
        id: const Uuid().v4(),
        deviceIp: deviceIp,
        frequencyOfSavingData: frequencyTime.toEntity(),
        name: deviceNameController.text,
        location: locationInformation.toEntity(),
      );
      context.read<SaveDeviceBloc>().add(
            SaveDeviceStarted(beeDeviceEntity: beeDevice),
          );
    }
  }
}
