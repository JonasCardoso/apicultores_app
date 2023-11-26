import 'package:apicultores_app/features/graphs/business_logic/entities/graph_period_entity.dart';
import 'package:apicultores_app/features/graphs/presentation/constants/period_picker_const.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/period_picker/date_picker_button.dart';
import 'package:design_system/design_system.dart';

class CustomPeriodPicker extends StatelessWidget {
  const CustomPeriodPicker({
    super.key,
    required this.periodData,
    required this.graphPeriod,
    required this.onPeriodChanged,
  });
  final PeriodData? periodData;
  final GraphPeriodEntity? graphPeriod;
  final void Function(GraphPeriodEntity) onPeriodChanged;
  @override
  Widget build(BuildContext context) {
    final graphPeriod = this.graphPeriod ??
        (periodData?.graphPeriod ??
            GraphPeriodEntity(
              startDate: DateTime.now().subtract(
                const Duration(
                  days: 1,
                ),
              ),
            ));
    final endDate = graphPeriod.endDate;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.large,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "De ",
                style: MyTypography.bodyStrong,
              ),
              const SizedBox(
                width: Spacing.small,
              ),
              Row(
                children: [
                  DatePickerButton(
                      minDate: DateTime.fromMicrosecondsSinceEpoch(0),
                      maxDate: endDate ?? DateTime.now(),
                      initialDateTime: graphPeriod.startDate,
                      onPeriodChanged: (newDate) {
                        final newGraphPeriod = graphPeriod.copyWith(
                          startDate: newDate,
                        );
                        onPeriodChanged(newGraphPeriod);
                      }),
                ],
              ),
              const SizedBox(
                width: Spacing.small,
              ),
              Text(
                " até",
                style: MyTypography.bodyStrong,
              ),
            ],
          ),
          const SizedBox(
            height: Spacing.small,
          ),
          DatePickerButton(
              minDate: graphPeriod.startDate.add(const Duration(days: 1)),
              maxDate: DateTime.now(),
              initialDateTime: endDate,
              onPeriodChanged: (newDate) {
                final newGraphPeriod = graphPeriod.copyWith(
                  setEndDate: () => newDate,
                );
                onPeriodChanged(newGraphPeriod);
              }),
        ],
      ),
    );
  }
}
