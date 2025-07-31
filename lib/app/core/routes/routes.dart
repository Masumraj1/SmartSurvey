import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_survey/app/core/extension/extension.dart';
import '../../view/screens/form_page/form_page.dart';
import '../../view/screens/from_list_page/from_list_page.dart';
import '../../view/screens/splash/splash_screen.dart';
import '../../view/screens/submission_view_page/submission_view_page.dart';
import 'route_path.dart';

class AppRouter {
  static final GoRouter initRoute = GoRouter(
      initialLocation: RoutePath.formPage.addBasePath,
      debugLogDiagnostics: true,
      navigatorKey: GlobalKey<NavigatorState>(),
      routes: [
        ///======================= Initial Route =======================
        GoRoute(
          name: RoutePath.splashScreen,
          path: RoutePath.splashScreen.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child:  SplashScreen(),
            state: state,
          ),
        ),

        ///======================= FormPage=======================
        GoRoute(
          name: RoutePath.formPage,
          path: RoutePath.formPage.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child:  FormPage(),
            state: state,
          ),
        ),

        ///======================= FromListPage=======================
        GoRoute(
          name: RoutePath.fromListPage,
          path: RoutePath.fromListPage.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child:  FromListPage(),
            state: state,
          ),
        ),

        ///======================= SubmissionViewPage=======================
        GoRoute(
          name: RoutePath.submissionViewPage,
          path: RoutePath.submissionViewPage.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child:  SubmissionViewPage(),
            state: state,
          ),
        ),


      ]);

  static CustomTransitionPage _buildPageWithAnimation(
      {required Widget child,
      required GoRouterState state,
      bool disableAnimation = false}) {
    if (disableAnimation) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: Duration.zero, // Disable animation
        transitionsBuilder: (_, __, ___, child) => child, // No transition
      );
    } else {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );
    }
  }

  static GoRouter get route => initRoute;
}
