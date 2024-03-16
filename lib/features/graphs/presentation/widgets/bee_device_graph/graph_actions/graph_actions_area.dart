
import 'package:apicultores_app/features/graphs/business_logic/bloc/export_graph_in_csv_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_data_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphActionsArea extends StatelessWidget {
  const GraphActionsArea({
    super.key,
    required this.graphData,
  });

  final GraphDataEntity graphData;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ExportGraphInCsvBloc, ExportGraphInCsvState>(
      listener: (context, state) {
        if (state is ExportGraphInCsvSuccess) {
          const SnackBar(
                  message: 'Arquivo exportado com sucesso!',
                  variant: SnackBarVariant.success)
              .show(context);
        } else if (state is ExportGraphInCsvFailure) {
          const SnackBar(
                  message: 'Algo deu errado com a exportação',
                  variant: SnackBarVariant.error)
              .show(context);
        }
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.large,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Opções',
                style: MyTypography.h3,
              ),
              ActionsList(items: [
                ActionsListItem(
                    label: 'Exportar em CSV',
                    onPressed: () {
                      context.read<ExportGraphInCsvBloc>().add(
                            ExportGrapthInCsvExported(graphData),
                          );
                    },
                    leftIcon: Icons.share,
                    rightIcon: Icons.chevron_right),
              ])
            ],
          )),
    );
  }
}
