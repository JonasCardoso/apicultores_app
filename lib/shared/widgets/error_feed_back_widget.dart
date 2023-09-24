import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class ErrorFeedBackWidget extends StatelessWidget {
  const ErrorFeedBackWidget({
    super.key,
    this.errorType = ErrorType.server,
    required this.onButtonClick,
  });
  final ErrorType errorType;
  final VoidCallback onButtonClick;
  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
      icon: Icons.error_outline,
      iconColor: SurfaceColor.error,
      title: Strings.errorFeedBackTitle,
      description: Strings.errorFeedBackDescription,
      buttonLabel: Strings.errorFeedBackButtonLabel,
      onButtonClick: onButtonClick,
    );
  }
}

enum ErrorType { connection, server }
