import 'package:apicultores_app/features/graphs/business_logic/entities/time_scale_type.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/bee_device_graph_data_builder.dart';
import 'package:design_system/design_system.dart';
import 'package:intl/intl.dart';

class GraphDateInformationWidget extends StatelessWidget {
  const GraphDateInformationWidget({
    super.key,
    required this.graphDataBuilder,
  });
  final BeeDeviceGraphDataBuilder graphDataBuilder;
  @override
  Widget build(BuildContext context) {
    return Text(
      _buildInformationTextForDate(),
      style: MyTypography.bodyStrong.copyWith(color: TextColor.unspecial),
    );
  }

  String _buildInformationTextForDate() {
    // ignore: prefer_interpolation_to_compose_strings
    return 'de ' +
        _formatStartDate(graphDataBuilder.configurations.startDate) +
        " até " +
        _formatEndDate(
          graphDataBuilder.configurations.startDate,
          graphDataBuilder.configurations.endDate,
        );
  }

  String _formatStartDate(DateTime startDate) => _isToday(startDate)
      ? 'hoje ${_formatDate(startDate)}'
      : _formatDate(startDate, complete: true);

  String _formatEndDate(DateTime startDate, DateTime? endDate) {
    if (endDate == null) {
      return _formatNowTime();
    } else if (startDate.day != endDate.day) {
      return _isToday(endDate)
          ? 'hoje ${_formatDate(
              endDate,
            )}'
          : _formatDate(
              endDate,
              complete: true,
            );
    } else {
      return _formatDate(
        endDate,
      );
    }
  }

  String _formatNowTime() {
    switch (graphDataBuilder.configurations.timeScaleType) {
      case TimeScaleType.hour:
      case TimeScaleType.day:
        return 'agora';
      case TimeScaleType.week:
      case TimeScaleType.month:
      case TimeScaleType.year:
        return 'hoje';
    }
  }

  String _formatDate(DateTime date, {bool complete = false}) {
    switch (graphDataBuilder.configurations.timeScaleType) {
      case TimeScaleType.hour:
        return complete
            ? DateFormat('EEE, dd/MM HH:mm', 'pt_BR').format(date)
            : DateFormat.Hm().format(date);
      case TimeScaleType.day:
        return complete
            ? DateFormat('EEE, dd/MM HH:mm', 'pt_BR').format(date)
            : DateFormat('HH:mm', 'pt_BR').format(date);
      case TimeScaleType.week:
        return DateFormat('EEE, dd/MM', 'pt_BR').format(date);
      case TimeScaleType.month:
        return DateFormat('dd/MM/yyyy').format(date);
      case TimeScaleType.year:
        return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.day == now.day &&
        date.month == now.month &&
        date.year == now.year;
  }
}
