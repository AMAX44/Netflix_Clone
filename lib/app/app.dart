import 'package:netflix_clone/ui/detail_screen/detail_screen_view.dart';
import 'package:netflix_clone/ui/home_view/home_view.dart';
import 'package:netflix_clone/ui/startup_view/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: DetailScreen),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
