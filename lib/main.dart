import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_terget_app/features/business/data/models/business_model.dart';
import 'package:my_terget_app/features/business/presentation/blocs/business/business_bloc.dart';
import 'package:my_terget_app/features/marketing/data/models/marketing_model.dart';
import 'package:my_terget_app/features/marketing/presentation/blocs/marketing/marketing_bloc.dart';
import 'package:my_terget_app/features/product/data/models/product_model.dart';
import 'package:my_terget_app/features/product/presentation/blocs/product/product_bloc.dart';
import 'package:my_terget_app/features/profile/data/models/profile_model.dart';
import 'package:my_terget_app/features/profile/presentation/blocs/profile/profile_bloc.dart';
import 'package:my_terget_app/injection.dart';
import 'package:my_terget_app/routes/app_routes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(BusinessModelAdapter());
  Hive.registerAdapter(MarketingModelAdapter());
  Hive.registerAdapter(ProfileModelAdapter());
  setupSl();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProductBloc>()),
        BlocProvider(create: (_) => sl<BusinessBloc>()),
        BlocProvider(create: (_) => sl<MarketingBloc>()),
        BlocProvider(create: (_) => sl<ProfileBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
