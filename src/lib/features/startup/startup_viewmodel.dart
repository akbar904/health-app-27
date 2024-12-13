import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 2));
    _navigationService.clearStackAndShow('/home-view');
  }

  @override
  void onInit() {
    runStartupLogic();
    super.onInit();
  }
}
