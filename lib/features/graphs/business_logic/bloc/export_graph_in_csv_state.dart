part of 'export_graph_in_csv_bloc.dart';

sealed class ExportGraphInCsvState extends Equatable {
  const ExportGraphInCsvState();

  @override
  List<Object> get props => [];
}

final class ExportGraphInCsvInitial extends ExportGraphInCsvState {}

final class ExportGraphInCsvLoading extends ExportGraphInCsvState {
  const ExportGraphInCsvLoading();
}

final class ExportGraphInCsvSuccess extends ExportGraphInCsvState {
  const ExportGraphInCsvSuccess();
}

final class ExportGraphInCsvFailure extends ExportGraphInCsvState {
  const ExportGraphInCsvFailure();
}
