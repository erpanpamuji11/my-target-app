import 'package:go_router/go_router.dart';
import 'package:my_terget_app/features/business/domain/entities/business.dart';
import 'package:my_terget_app/features/business/presentation/pages/add_business_page.dart';
import 'package:my_terget_app/features/business/presentation/pages/edit_business_page.dart';
import 'package:my_terget_app/features/home/presentation/pages/home_page.dart';
import 'package:my_terget_app/features/marketing/domain/entities/marketing.dart';
import 'package:my_terget_app/features/marketing/presentation/pages/add_marketing_page.dart';
import 'package:my_terget_app/features/marketing/presentation/pages/edit_marketing_page.dart';
import 'package:my_terget_app/features/product/domain/entities/product.dart';
import 'package:my_terget_app/features/product/presentation/pages/add_target_page.dart';
import 'package:my_terget_app/features/product/presentation/pages/edit_product_page.dart';
import 'package:my_terget_app/features/profile/presentation/pages/add_profile_page.dart';
import 'package:my_terget_app/features/profile/presentation/pages/profile_page.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/add_target',
        builder: (context, state) => const AddTargetPage(),
      ),
      GoRoute(
        path: '/edit_product/:index',
        builder: (context, state) {
          String idProduct = state.pathParameters['index'] as String;
          return EditProductPage(
            product: state.extra as Product,
            index: idProduct,
          );
        },
      ),
      GoRoute(
        path: '/add_business',
        builder: (context, state) => const AddBusinessPage(),
      ),
      GoRoute(
        path: '/edit_business/:index',
        builder: (context, state) {
          String idProduct = state.pathParameters['index'] as String;
          return EditBusinessPage(
            business: state.extra as Business,
            index: int.parse(idProduct),
          );
        },
      ),
      GoRoute(
        path: '/add_marketing',
        builder: (context, state) => const AddMarketingPage(),
      ),
      GoRoute(
        path: '/edit_marketing/:index',
        builder: (context, state) {
          String idProduct = state.pathParameters['index'] as String;
          return EditMarketingPage(
            marketing: state.extra as Marketing,
            index: int.parse(idProduct),
          );
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/edit_profile',
        builder: (context, state) => AddProfilePage(),
      )
    ],
  );
}
