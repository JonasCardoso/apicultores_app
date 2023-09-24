part of 'my_icon.dart';

enum IconSize {
  tiny,
  small,
  medium,
  large,
}

extension _IconSizeInformation on IconSize {
  double get size {
    switch (this) {
      case IconSize.tiny:
        return 8;
      case IconSize.small:
        return 16;
      case IconSize.medium:
        return 24;
      case IconSize.large:
        return 32;
    }
  }
}
