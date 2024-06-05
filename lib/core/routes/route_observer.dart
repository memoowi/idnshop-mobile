import 'package:flutter/material.dart';

class RouteObserverService extends RouteObserver<PageRoute<dynamic>> {
  String? currentRoute;

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route is PageRoute) {
      currentRoute = route.settings.name;
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute is PageRoute) {
      currentRoute = previousRoute.settings.name;
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute is PageRoute) {
      currentRoute = newRoute.settings.name;
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (previousRoute is PageRoute) {
      currentRoute = previousRoute.settings.name;
    }
    super.didRemove(route, previousRoute);
  }
}
