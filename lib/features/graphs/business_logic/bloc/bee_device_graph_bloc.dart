import 'package:apicultores_app/features/graphs/business_logic/entities/graph_data_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_properties_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/use_cases/bee_device_graph_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';

part 'bee_device_graph_event.dart';
part 'bee_device_graph_state.dart';

class BeeDeviceGraphBloc
    extends Bloc<BeeDeviceGraphEvent, BeeDeviceGraphState> {
  BeeDeviceGraphBloc(this._useCase) : super(const BeeDeviceGraphInitial()) {
    on<BeeDeviceGraphFetched>(_onBeeDeviceGraphFetched);
    on<BeeDeviceGraphRestarted>(_onBeeDeviceGraphRestarted);
  }

  final BeeDeviceGraphUseCase _useCase;

  void _onBeeDeviceGraphFetched(
    BeeDeviceGraphFetched event,
    Emitter<BeeDeviceGraphState> emit,
  ) async {
    emit(const BeeDeviceGraphLoading());
    try {
      final data = await _useCase.getGraphData(event.properties);
      emit(BeeDeviceGraphSuccess(
        data: data,
        properties: event.properties,
      ));
    } catch (error, stk) {
      debugPrint(error.toString());
      debugPrint(stk.toString());
      emit(const BeeDeviceGraphFailure());
    }
  }

  void _onBeeDeviceGraphRestarted(
    BeeDeviceGraphRestarted event,
    Emitter<BeeDeviceGraphState> emit,
  ) async {
    emit(const BeeDeviceGraphInitial());
  }
}
