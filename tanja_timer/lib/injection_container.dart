import 'package:kiwi/kiwi.dart';
import 'package:tanja_timer/services/appearance_service.dart';
import 'package:tanja_timer/services/router_service.dart';

void initKiwi() {
  KiwiContainer().registerSingleton((container) => RouterService());
  KiwiContainer().registerSingleton((container) => AppearanceService());
}
