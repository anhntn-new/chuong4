import 'package:chuong4/unit_5/config/custom_router.dart';
import 'package:chuong4/unit_5/view/home_page.dart';
import 'package:chuong4/unit_5/view/other_page.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';

  final GlobalKey<NavigatorState> navigatorKey;
  final int index;

  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilder();
    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoot,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
              settings: const RouteSettings(name: tabNavigatorRoot),
              builder: (context) => routeBuilders[initialRoute]!(context))
        ];
      },
      onGenerateRoute: CustomRouter.onGenerateNestedRoute,
    );
  }

  Map<String, WidgetBuilder> _routeBuilder() {
    return {tabNavigatorRoot: (context) => _getScreen(context, index)};
  }

  _getScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const OtherPage();
      case 2:
        return const OtherPage();
      case 3:
        return const OtherPage();
      case 4:
        return const OtherPage();

      default:
        return const Scaffold();
    }
  }
}
