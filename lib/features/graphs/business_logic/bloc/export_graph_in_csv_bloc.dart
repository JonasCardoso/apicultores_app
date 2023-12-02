import 'package:apicultores_app/features/graphs/business_logic/entities/graph_data_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/use_cases/export_graph_in_csv_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:csv/csv.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:share_plus/share_plus.dart';

part 'export_graph_in_csv_event.dart';
part 'export_graph_in_csv_state.dart';

class ExportGraphInCsvBloc
    extends Bloc<ExportGraphInCsvEvent, ExportGraphInCsvState> {
  ExportGraphInCsvBloc(this._useCase) : super(ExportGraphInCsvInitial()) {
    on<ExportGrapthInCsvExported>(_onExported);
  }

  final ExportGraphInCsvUseCase _useCase;

  void _onExported(ExportGrapthInCsvExported event, Emitter emit) async {
    try {
      emit(const ExportGraphInCsvLoading());
      final graphCsv = const ListToCsvConverter()
          .convert(event.graphData.transformDataInCSV());
      final path = await _useCase.createCsvFileAndGetPath(graphCsv);
      final shareResult = await _useCase.shareCsvFile(path);
      if (shareResult == ShareResultStatus.success) {
        emit(const ExportGraphInCsvSuccess());
      } else if (shareResult == ShareResultStatus.unavailable) {
        emit(const ExportGraphInCsvFailure());
      }
    } catch (e) {
      emit(const ExportGraphInCsvFailure());
      debugPrint(e.toString());
    }
  }
}
