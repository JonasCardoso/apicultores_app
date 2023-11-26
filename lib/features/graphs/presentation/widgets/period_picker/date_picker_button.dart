import 'package:design_system/design_system.dart';
import 'package:intl/intl.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton(
      {super.key,
      this.initialDateTime,
      required this.minDate,
      required this.maxDate,
      required this.onPeriodChanged});
  final DateTime? initialDateTime;
  final DateTime minDate;
  final DateTime maxDate;
  final void Function(DateTime) onPeriodChanged;
  @override
  Widget build(BuildContext context) {
    final initialDateTime = this.initialDateTime;
    return Button(
      label: initialDateTime != null
          ? DateFormat('EEE, dd/MM/yyyy, HH:mm', 'pt_BR')
              .format(initialDateTime)
          : 'agora',
      variant: ButtonVariant.outlined,
      icon: Icons.calendar_month,
      onPressed: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: initialDateTime ?? DateTime.now(),
          firstDate: minDate,
          lastDate: maxDate,
        );
        if (date != null) {
          onPeriodChanged(date);
        }
      },
    );
  }
}
