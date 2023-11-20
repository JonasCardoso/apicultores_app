part of 'button.dart';

enum ButtonVariant {
  primary,
  outlined,
  destructive,
}

extension on ButtonVariant {
  Color backgroundColor(bool disabled) {
    switch (this) {
      case ButtonVariant.primary:
        return disabled ? SurfaceColor.deactivated : SurfaceColor.primary;
      case ButtonVariant.outlined:
        return disabled ? SurfaceColor.deactivated : SurfaceColor.primary;
      case ButtonVariant.destructive:
        return disabled
            ? const Color.fromARGB(255, 244, 133, 133)
            : SurfaceColor.error;
    }
  }

  Color textColor(bool disabled) {
    switch (this) {
      case ButtonVariant.primary:
        return disabled ? TextColor.deactivated : TextColor.primary;
      case ButtonVariant.outlined:
        return disabled ? TextColor.deactivated : TextColor.primary;
      case ButtonVariant.destructive:
        return disabled
            ? const Color.fromARGB(255, 225, 225, 225)
            : TextColor.tertiary;
    }
  }
}
