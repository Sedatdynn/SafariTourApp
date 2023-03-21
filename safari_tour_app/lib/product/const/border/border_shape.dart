import 'package:flutter/material.dart';

import 'border_radi.dart';

class ShapedBorders {
  /// Low rounded rectangle shaped border. Radius: 12.
  static const RoundedRectangleBorder roundedLow =
      RoundedRectangleBorder(borderRadius: BorderRadi.lowCircular);

  /// Low-Medium rounded rectangle shaped border. Radius: 16.
  static const RoundedRectangleBorder roundedLowMed =
      RoundedRectangleBorder(borderRadius: BorderRadi.lowMedCircular);

  /// Medium rounded rectangle shaped border. Radius: 18.
  static const RoundedRectangleBorder roundedMedium =
      RoundedRectangleBorder(borderRadius: BorderRadi.mediumCircular);

  /// Medium-High rounded rectangle shaped border. Radius: 24.
  static const RoundedRectangleBorder roundedMedHigh =
      RoundedRectangleBorder(borderRadius: BorderRadi.medHighCircular);

  /// High rounded rectangle shaped border. Radius: 26.
  static const RoundedRectangleBorder roundedHigh =
      RoundedRectangleBorder(borderRadius: BorderRadi.highCircular);

  /// Extremely rounded rectangle shaped border. Radius: 30.
  static const RoundedRectangleBorder roundedExtreme =
      RoundedRectangleBorder(borderRadius: BorderRadi.extremeCircular);
}
