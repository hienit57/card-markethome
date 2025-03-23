import 'package:flutter/material.dart';

import 'flavor_settings.dart';

Future<FlavorSettings> getFlavorSettings(String? flavor) async {
  debugPrint('Application running in flavor: $flavor');
  if (flavor == 'development') {
    // environmentDev.addAll(<String, bool>{'isStudio': false});
    // await AppDelegate().run(environmentDev);
    return FlavorSettings.development();
  } else if (flavor == 'staging' ||
      flavor == 'Development' ||
      flavor == 'UAT') {
    // environmentDev.addAll(<String, bool>{'isStudio': false});
    // await AppDelegate().run(environmentDev);
    return FlavorSettings.staging();
  } else if (flavor?.toLowerCase() == 'production') {
    // environmentProd.addAll(<String, bool>{'isStudio': false});
    // await AppDelegate().run(environmentProd);
    return FlavorSettings.production();
  } else {
    throw Exception("Unknown flavor: $flavor");
  }
}
