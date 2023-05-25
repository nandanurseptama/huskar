// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:encrypt/encrypt.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hex/hex.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;
import 'package:uuid/uuid.dart' as _i7;

import 'cores/services/logger.dart' as _i5;
import 'cores/utils/uuid_generator.dart' as _i10;
import 'dependency.dart' as _i17;
import 'env.dart' as _i3;
import 'features/auth/data/auth_repository_impl.dart' as _i12;
import 'features/auth/domain/auth_repository.dart' as _i11;
import 'features/auth/domain/usecases/authenticate_usecase.dart' as _i13;
import 'features/auth/domain/usecases/login_usecase.dart' as _i14;
import 'features/auth/domain/usecases/logout_usecase.dart' as _i15;
import 'features/auth/presentation/state_management/auth_provider.dart' as _i16;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $InitDependency(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final commonModule = _$CommonModule();
  gh.factory<_i3.Env>(() => commonModule.env);
  gh.factory<_i4.HexCodec>(() => commonModule.hexCodec);
  gh.factory<_i5.Logger>(() => commonModule.logger);
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => commonModule.localStorage,
    preResolve: true,
  );
  gh.factory<_i7.Uuid>(() => commonModule.uuid);
  gh.factory<_i8.Dio>(() => commonModule.getDio(
        gh<_i6.SharedPreferences>(),
        gh<_i3.Env>(),
      ));
  gh.factory<_i9.Encrypter>(() => commonModule.getEncrypter(gh<_i3.Env>()));
  gh.factory<_i10.UUIDGenerator>(
      () => _i10.UUIDGenerator(uuid: gh<_i7.Uuid>()));
  gh.lazySingleton<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl(
        env: gh<_i3.Env>(),
        httpClient: gh<_i8.Dio>(),
        localStorage: gh<_i6.SharedPreferences>(),
        encrypter: gh<_i9.Encrypter>(),
      ));
  gh.lazySingleton<_i13.AuthenticateUsecase>(() => _i13.AuthenticateUsecase(
        uuidGenerator: gh<_i10.UUIDGenerator>(),
        logger: gh<_i5.Logger>(),
        authRepository: gh<_i11.AuthRepository>(),
      ));
  gh.lazySingleton<_i14.LoginUsecase>(() => _i14.LoginUsecase(
        uuidGenerator: gh<_i10.UUIDGenerator>(),
        logger: gh<_i5.Logger>(),
        authRepository: gh<_i11.AuthRepository>(),
      ));
  gh.lazySingleton<_i15.LogoutUsecase>(() => _i15.LogoutUsecase(
        uuidGenerator: gh<_i10.UUIDGenerator>(),
        logger: gh<_i5.Logger>(),
        authRepository: gh<_i11.AuthRepository>(),
      ));
  gh.lazySingleton<_i16.AuthProvider>(() => _i16.AuthProvider(
        authenticateUsecase: gh<_i13.AuthenticateUsecase>(),
        loginUsecase: gh<_i14.LoginUsecase>(),
        logoutUsecase: gh<_i15.LogoutUsecase>(),
      ));
  return getIt;
}

class _$CommonModule extends _i17.CommonModule {}
