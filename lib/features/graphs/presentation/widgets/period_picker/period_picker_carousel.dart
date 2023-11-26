import 'package:apicultores_app/features/graphs/presentation/constants/period_picker_const.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/period_picker/period_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:design_system/design_system.dart';

class PeriodPickerCarousel extends StatelessWidget {
  const PeriodPickerCarousel({
    super.key,
    required this.onPeriodChanged,
    required this.selectedDate,
  });
  final void Function(PeriodData?) onPeriodChanged;
  final PeriodData? selectedDate;
  @override
  Widget build(BuildContext context) {
    final selectedDate = this.selectedDate;

    final initialPage =
        selectedDate != null ? PeriodData.values.indexOf(selectedDate) : null;
    return CarouselSlider.builder(
      itemCount: PeriodData.values.length + 1,
      itemBuilder: (context, index, realIndex) {
        if (index == PeriodData.values.length) {
          return PeriodCard(
            periodData: null,
            isSelected: selectedDate == null,
          );
        }
        final periodData = PeriodData.values[index];
        return PeriodCard(
          periodData: periodData,
          isSelected: periodData == selectedDate,
        );
      },
      options: CarouselOptions(
        initialPage: initialPage ?? PeriodData.values.length,
        viewportFraction: 0.6,
        aspectRatio: 4.6,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          if (index == PeriodData.values.length) {
            onPeriodChanged(null);
            return;
          }
          final periodData = PeriodData.values[index];
          onPeriodChanged(periodData);
        },
      ),
    );
  }
}
