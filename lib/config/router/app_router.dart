// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:outmap/features/auth/auth.dart';
import 'package:outmap/features/products/products.dart';
import 'package:outmap/features/settings/presentation/screens/screen.dart';

import '../../features/auth/presentation/providers/providers.dart';
import '../../features/outmap/out_map.dart';
import 'app_router_notifier.dart';
import 'app_router_utils.dart';
import 'screen/not_found_screen.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: PAGES.splash.screenPath,
    refreshListenable: goRouterNotifier,
    routes: [
      ///* Auth Routes
      GoRoute(
        path: PAGES.splash.screenPath,
        name: PAGES.splash.screenName,
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        path: PAGES.login.screenPath,
        name: PAGES.login.screenName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: PAGES.register.screenPath,
        name: PAGES.register.screenName,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: PAGES.registerHeadquarters.screenPath,
        name: PAGES.registerHeadquarters.screenName,
        builder: (context, state) => const HeadQuartersConfigurarionScreen(),
      ),

      ///* OutMap Routes
      GoRoute(
        path: PAGES.home.screenPath,
        name: PAGES.home.screenName,
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: PAGES.gpsMap.screenPath,
        name: PAGES.gpsMap.screenName,
        builder: (context, state) => const MapScreen(),
      ),
      GoRoute(
        path: '/gps-access',
        builder: (context, state) => const GpsAccessAcreen(),
      ),

      //* Settings
      GoRoute(
        path: PAGES.venuesAndEvents.screenPath,
        name: PAGES.venuesAndEvents.screenName,
        builder: (context, state) => const VenuesAndEventsScreen(),
      ),

      ///* Product Routes
      GoRoute(
        path: '/product',
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        path: '/product/:id',
        builder: (context, state) =>
            ProductScreen(productId: state.pathParameters['id'] ?? 'no-id'),
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;
      debugPrint('==> $authStatus -- $isGoingTo');

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
        return null;
      }
      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == PAGES.login.screenPath ||
            isGoingTo == PAGES.register.screenPath ||
            isGoingTo == PAGES.registerHeadquarters.screenPath ||
            //! remover de esta validación isGoingTo == PAGES.venuesAndEvents.screenPath y lo que esté abajo igual cuando los eps esten arriba
            isGoingTo == PAGES.venuesAndEvents.screenPath) return null;
        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/';
        }
      }

      return null;
    },
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
