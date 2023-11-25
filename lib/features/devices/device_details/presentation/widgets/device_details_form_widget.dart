import 'package:apicultores_app/features/devices/device_details/presentation/device_details_navigation.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/widgets/connection_message_widget.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/widgets/device_details_action_buttons.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/widgets/device_details_edit_button.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/widgets/device_details_frequency_form.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/widgets/device_details_location_form.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/widgets/device_details_name_form.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_frequency_saving_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_location_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:design_system/design_system.dart';

class DeviceDetailsFormWidget extends StatefulWidget {
  const DeviceDetailsFormWidget({
    super.key,
    required this.device,
    required this.navigation,
  });
  final LocalBeeDeviceEntity device;
  final DeviceDetailsNavigation navigation;
  @override
  State<DeviceDetailsFormWidget> createState() =>
      _DeviceDetailsFormWidgetState();
}

class _DeviceDetailsFormWidgetState extends State<DeviceDetailsFormWidget> {
  bool didChangeSomething = false;
  late final DeviceDetailsFormModel formModel;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController deviceNameController;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    deviceNameController =
        TextEditingController(text: widget.device.device.name);
    formModel = DeviceDetailsFormModel(
      deviceName: deviceNameController,
      location: widget.device.device.location,
      frequencyTime: widget.device.device.frequencyOfSavingData,
    );

    formModel.onAnyValueChanged(() {
      final oldValue = didChangeSomething;
      if (formModel.deviceName.value.text != widget.device.device.name ||
          formModel.location.value != widget.device.device.location ||
          formModel.frequencyTime.value !=
              widget.device.device.frequencyOfSavingData) {
        didChangeSomething = true;
      } else {
        didChangeSomething = false;
      }
      if (oldValue != didChangeSomething) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.large,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: Spacing.large,
                ),
                ConnectionMessageWidget(
                  status: widget.device.status,
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                DeviceDetailsNameForm(
                  controller: deviceNameController,
                ),
                const SizedBox(
                  height: Spacing.xxlarge,
                ),
                DeviceDetailsLocationForm(
                  location: formModel.location,
                  navigation: widget.navigation,
                ),
                const SizedBox(
                  height: Spacing.xxlarge,
                ),
                DeviceDetailsFrequencyForm(
                  frequencyTime: formModel.frequencyTime,
                ),
                const SizedBox(
                  height: Spacing.huge,
                ),
                const DeviceDetailsActionButtons(),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: didChangeSomething
          ? [
              DeviceDetailsEditButton(
                formModel: formModel,
                formKey: formKey,
                device: widget.device,
              )
            ]
          : null,
    );
  }
}

class DeviceDetailsFormModel {
  final ValueNotifier<TextEditingValue> deviceName;
  final ValueNotifier<BeeDeviceLocationEntity> location;
  final ValueNotifier<BeeDeviceFrequencySavingEntity> frequencyTime;

  DeviceDetailsFormModel({
    required this.deviceName,
    required BeeDeviceLocationEntity location,
    required BeeDeviceFrequencySavingEntity frequencyTime,
  })  : location = ValueNotifier(location),
        frequencyTime = ValueNotifier(frequencyTime);

  void onAnyValueChanged(VoidCallback callback) {
    deviceName.addListener(callback);
    location.addListener(callback);
    frequencyTime.addListener(callback);
  }
}
