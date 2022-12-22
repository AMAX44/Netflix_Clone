import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class StartUpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  startupLogic() async {
    await Future.delayed(
      const Duration(seconds: 6),
    );
    _navigationService.navigateTo(Routes.homeView);
  }
}
