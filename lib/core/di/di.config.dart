// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alice/alice.dart' as _i917;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/home/data/datasources/user_data_source.dart' as _i218;
import '../../features/home/data/repositories/user_repository_iplm.dart'
    as _i218;
import '../../features/home/domain/usecases/get_all_user_usecase.dart' as _i415;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../dio/app_dio.dart' as _i841;
import '../local/local_storage.dart' as _i381;
import '../logger/app_logger.dart' as _i293;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appLogger = _$AppLogger();
    final storageModule = _$StorageModule();
    final appNetworkModule = _$AppNetworkModule();
    gh.singleton<_i974.Logger>(() => appLogger.provideLogger());
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => storageModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i917.Alice>(() => appNetworkModule.provideAlice());
    gh.lazySingleton<_i381.SharedPrefs>(
        () => _i381.SharedPrefs(gh<_i460.SharedPreferences>()));
    gh.singleton<_i361.Dio>(
        () => appNetworkModule.provideDio(gh<_i917.Alice>()));
    gh.singleton<_i218.UserDataSource>(() => appNetworkModule.getUserDataSource(
          gh<_i361.Dio>(),
          gh<String>(),
        ));
    gh.factory<_i218.UserRepositoryImpl>(() =>
        _i218.UserRepositoryImpl(userDataSource: gh<_i218.UserDataSource>()));
    gh.factory<_i415.GetAllUserUsecase>(() => _i415.GetAllUserUsecase(
        userRepositoryImpl: gh<_i218.UserRepositoryImpl>()));
    gh.singleton<_i9.HomeCubit>(
        () => _i9.HomeCubit(getAllUserUsecase: gh<_i415.GetAllUserUsecase>()));
    return this;
  }
}

class _$AppLogger extends _i293.AppLogger {}

class _$StorageModule extends _i381.StorageModule {}

class _$AppNetworkModule extends _i841.AppNetworkModule {}
