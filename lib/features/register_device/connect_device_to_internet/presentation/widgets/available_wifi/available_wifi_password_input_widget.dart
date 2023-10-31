import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class AvailableWiFiPasswordInputWidget extends StatefulWidget {
  const AvailableWiFiPasswordInputWidget({
    super.key,
    required this.formKey,
    required this.passwordController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  @override
  State<AvailableWiFiPasswordInputWidget> createState() =>
      _AvailableWiFiPasswordInputWidgetState();
}

class _AvailableWiFiPasswordInputWidgetState
    extends State<AvailableWiFiPasswordInputWidget> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextField(
        controller: widget.passwordController,
        label: Strings.connectDeviceToInternetWiFiAvailablePasswordField,
        icon: _passwordVisible ? Icons.visibility : Icons.visibility_off,
        onIconTap: () {
          setState(() {
            _passwordVisible = !_passwordVisible;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return Strings
                .connectDeviceToInternetWiFiAvailablePasswordFieldInvalid;
          }
          return null;
        },
        obscureText: !_passwordVisible,
      ),
    );
  }
}
