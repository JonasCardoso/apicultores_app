import 'dart:io';

import 'package:apicultores_app/features/graphs/business_logic/entities/graph_data_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class GraphActionsArea extends StatelessWidget {
  const GraphActionsArea({
    super.key,
    required this.graphData,
  });

  final GraphDataEntity graphData;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  onPressed: () async {
                    final csv = const ListToCsvConverter()
                        .convert(graphData.transformDataInCSV());
                    final String directory =
                        (await getApplicationSupportDirectory()).path;
                    final path = "$directory/csv-${DateTime.now()}.csv";
                    print(path);
                    final File file = File(path);
                    await file.writeAsString(csv);
                    final result = await Share.shareXFiles([XFile(path)]);

                    if (result.status == ShareResultStatus.success) {
                      print('Thank you for sharing the picture!');
                    }
                  },
                  leftIcon: Icons.share,
                  rightIcon: Icons.chevron_right),
            ])
          ],
        ));
  }
}
