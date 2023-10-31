import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class ConnectDeviceToInternetLoadingWidget extends StatelessWidget {
  const ConnectDeviceToInternetLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: Spacing.xxlarge,
            width: Spacing.xxlarge,
            child: CircularProgressIndicator(),
          ),
          const SizedBox(
            height: Spacing.large,
          ),
          Text(
            Strings.connectDeviceToInternetLoadingTitle,
            style: MyTypography.p,
          )
        ],
      ),
    );
  }
}
