import 'package:apicultores_app/features/graphs/presentation/constants/period_picker_const.dart';
import 'package:design_system/design_system.dart';
import 'package:intl/intl.dart';

class PeriodCard extends StatelessWidget {
  const PeriodCard({
    super.key,
    required this.periodData,
    this.isSelected = false,
  });
  final PeriodData? periodData;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final periodData = this.periodData;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.small),
      margin: const EdgeInsets.all(
        Spacing.small,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? SurfaceColor.primaryPallete.shade200
            : SurfaceColor.foregroundColor,
        borderRadius: BorderRadius.circular(Spacing.small),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(periodData != null ? periodData.text : "Customizada",
              style: MyTypography.bodyStrong),
          const SizedBox(
            height: Spacing.xtiny,
          ),
          Text(
            periodData != null
                ? "De hoje até ${DateFormat('dd/MM/yyyy').format(periodData.graphPeriod.startDate)}"
                : "Data escolhida por você",
            style: MyTypography.captionRegular,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
