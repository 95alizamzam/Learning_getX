// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/products/data/repo_impl/products_repo_impl.dart' as _i8;
import '../../features/products/data/sources/remote.dart' as _i6;
import '../../features/products/domain/repository/base_products_repo.dart'
    as _i7;
import '../../features/products/presentations/controller/products_controller.dart'
    as _i10;
import '../network/base_remote_src.dart' as _i9;
import '../network/dio_http_client.dart' as _i5;
import '../network/dio_instance.dart' as _i3;
import '../network/http_client.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DioInstance>(() => _i3.DioInstance());
    gh.lazySingleton<_i4.HttpClient>(
        () => _i5.DioHttpClass(gh<_i3.DioInstance>()));
    gh.lazySingleton<_i6.ProductsRemoteSource>(
        () => _i6.ProductsRemoteSourceImpl(gh<_i4.HttpClient>()));
    gh.lazySingleton<_i7.BaseProductsRepository>(
        () => _i8.ProductsRepoImpl(gh<_i6.ProductsRemoteSource>()));
    gh.lazySingleton<_i9.BaseRemoteDataSource>(
        () => _i9.BaseRemoteDataSource(gh<_i4.HttpClient>()));
    gh.factory<_i10.ProductsController>(
        () => _i10.ProductsController(gh<_i7.BaseProductsRepository>()));
    return this;
  }
}
