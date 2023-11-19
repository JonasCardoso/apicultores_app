import 'package:apicultores_app/features/graphs/presentation/constants/period_picker_const.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/period_picker/period_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:design_system/design_system.dart';

class PeriodPickerCarousel extends StatelessWidget {
  PeriodPickerCarousel({
    super.key,
    required this.onPeriodChanged,
    PeriodData? selectedData,
  }) : selectedDate = selectedData ?? PeriodData.values.first;
  final void Function(PeriodData) onPeriodChanged;
  final PeriodData selectedDate;
  @override
  Widget build(BuildContext context) {
    final initialPage = PeriodData.values.indexOf(selectedDate);
    return CarouselSlider.builder(
      itemCount: PeriodData.values.length,
      itemBuilder: (context, index, realIndex) {
        final periodData = PeriodData.values[index];
        return PeriodCard(
          periodData: periodData,
          isSelected: periodData == selectedDate,
        );
      },
      options: CarouselOptions(
        initialPage: initialPage,
        viewportFraction: 0.6,
        aspectRatio: 4.6,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          final periodData = PeriodData.values[index];
          onPeriodChanged(periodData);
        },
      ),
    );
  }
}
