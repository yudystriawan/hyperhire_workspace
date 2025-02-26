import 'package:auto_route/auto_route.dart';
import 'package:hyperhire_client/presentation/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
  ];
}
