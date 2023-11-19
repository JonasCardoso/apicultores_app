import 'package:apicultores_app/features/devices/my_devices/data/repositories/bee_device_repository.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_data_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_properties_entity.dart';

class BeeDeviceGraphUseCase {
  final BeeDeviceRepository _beeDeviceRepository;

  BeeDeviceGraphUseCase(this._beeDeviceRepository);

  Future<GraphDataEntity> getGraphData(GraphPropertiesEntity properties) =>
      _beeDeviceRepository.getGraphData(properties);
}
