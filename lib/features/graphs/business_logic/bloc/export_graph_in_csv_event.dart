part of 'export_graph_in_csv_bloc.dart';

sealed class ExportGraphInCsvEvent extends Equatable {
  const ExportGraphInCsvEvent();

  @override
  List<Object> get props => [];
}

final class ExportGrapthInCsvExported extends ExportGraphInCsvEvent {
  const ExportGrapthInCsvExported(this.graphData);

  final GraphDataEntity graphData;

  @override
  List<Object> get props => [graphData];
}
