part of 'my_icon.dart';

enum IconSize {
  tiny,
  small,
  medium,
  large,
  xlarge,
  xxlarge,
  huge,
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
      case IconSize.xlarge:
        return 48;
      case IconSize.xxlarge:
        return 64;
      case IconSize.huge:
        return 98;
    }
  }
}
