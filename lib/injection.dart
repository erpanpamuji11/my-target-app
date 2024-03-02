import 'package:get_it/get_it.dart';
import 'package:my_terget_app/features/business/data/data_sources/business_data_source.dart';
import 'package:my_terget_app/features/business/data/repositories/business_repository_impl.dart';
import 'package:my_terget_app/features/business/domain/repositories/business_repository.dart';
import 'package:my_terget_app/features/business/domain/usecases/delete_business.dart';
import 'package:my_terget_app/features/business/domain/usecases/get_business.dart';
import 'package:my_terget_app/features/business/domain/usecases/post_business.dart';
import 'package:my_terget_app/features/business/domain/usecases/update_business.dart';
import 'package:my_terget_app/features/business/presentation/blocs/business/business_bloc.dart';
import 'package:my_terget_app/features/marketing/data/data_sources/marketing_data_source.dart';
import 'package:my_terget_app/features/marketing/data/repositories/marketing_repository_impl.dart';
import 'package:my_terget_app/features/marketing/domain/repositories/marketing_repository.dart';
import 'package:my_terget_app/features/marketing/domain/usecases/delete_marketing.dart';
import 'package:my_terget_app/features/marketing/domain/usecases/get_marketing.dart';
import 'package:my_terget_app/features/marketing/domain/usecases/post_marketing.dart';
import 'package:my_terget_app/features/marketing/domain/usecases/update_marketing.dart';
import 'package:my_terget_app/features/marketing/presentation/blocs/marketing/marketing_bloc.dart';
import 'package:my_terget_app/features/product/data/data_sources/product_datasource.dart';
import 'package:my_terget_app/features/product/data/repositories/product_repository_impl.dart';
import 'package:my_terget_app/features/product/domain/repositories/product_repository.dart';
import 'package:my_terget_app/features/product/domain/usecases/delete_product.dart';
import 'package:my_terget_app/features/product/domain/usecases/get_product.dart';
import 'package:my_terget_app/features/product/domain/usecases/post_product.dart';
import 'package:my_terget_app/features/product/domain/usecases/update_product.dart';
import 'package:my_terget_app/features/product/presentation/blocs/product/product_bloc.dart';
import 'package:my_terget_app/features/profile/data/data_sources/profile_data_source.dart';
import 'package:my_terget_app/features/profile/data/presentation/profile_repository_impl.dart';
import 'package:my_terget_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:my_terget_app/features/profile/domain/usecases/get_profile.dart';
import 'package:my_terget_app/features/profile/domain/usecases/post_profile.dart';
import 'package:my_terget_app/features/profile/presentation/blocs/profile/profile_bloc.dart';

final sl = GetIt.instance;

void setupSl(){

  //bloc
  sl.registerFactory(() => ProductBloc(sl(), sl(), sl(), sl(),));
  sl.registerFactory(() => BusinessBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => MarketingBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => ProfileBloc(sl(), sl()));

  //datasource
  sl.registerLazySingleton<ProductDataSource>(() => ProductDataSourceImpl());
  sl.registerLazySingleton<BusinessDataSource>(() => BusinessDataSourceImpl());
  sl.registerLazySingleton<MarketingDataSource>(() => MarketingDataSourceImpl());
  sl.registerLazySingleton<ProfileDataSource>(() => ProfileDataSourceImpl());

//repo
sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(sl()));
sl.registerLazySingleton<BusinessRepository>(() => BusinessRepositoryImpl(sl()));
sl.registerLazySingleton<MarketingRepository>(() => MarketingRepositoryImpl(sl()));
sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(sl()));

//usecase
sl.registerLazySingleton(() => GetProduct(sl()));
sl.registerLazySingleton(() => PostProduct(sl()));
sl.registerLazySingleton(() => UpdateProduct(sl()));
sl.registerLazySingleton(() => DeleteProduct(sl()));
sl.registerLazySingleton(() => GetBusiness(sl()));
sl.registerLazySingleton(() => PostBusiness(sl()));
sl.registerLazySingleton(() => UpdateBusiness(sl()));
sl.registerLazySingleton(() => DeleteBusiness(sl()));
sl.registerLazySingleton(() => GetMarketing(sl()));
sl.registerLazySingleton(() => PostMarketing(sl()));
sl.registerLazySingleton(() => UpdateMarketing(sl()));
sl.registerLazySingleton(() => DeleteMarketing(sl()));
sl.registerLazySingleton(() => GetProfile(sl()));
sl.registerLazySingleton(() => PostProfile(sl()));
}