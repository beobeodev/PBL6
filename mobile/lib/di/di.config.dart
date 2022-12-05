// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../modules/auth/data/datasources/auth.datasource.dart' as _i3;
import '../modules/auth/data/repositories/auth.repository.dart' as _i4;
import '../modules/base/data/datasource/verify_auth_local.datasource.dart'
    as _i13;
import '../modules/base/data/datasource/verify_auth_remote.datasource.dart'
    as _i14;
import '../modules/base/data/repository/verify_auth.repository.dart' as _i15;
import '../modules/favorite_host/data/datasource/favorite_host.datasource.dart'
    as _i5;
import '../modules/favorite_host/data/repository/favorite_host.repository.dart'
    as _i6;
import '../modules/home/data/datasources/location.datasource.dart' as _i9;
import '../modules/home/data/repositories/location.repository.dart' as _i10;
import '../modules/profile/data/datasources/profile.datasource.dart' as _i11;
import '../modules/profile/data/repositories/profile.repository.dart' as _i12;
import '../modules/search_hotel/data/datasources/host.datasource.dart' as _i7;
import '../modules/search_hotel/data/repositories/host.repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AuthDataSource>(() => _i3.AuthDataSource());
  gh.lazySingleton<_i4.AuthRepository>(
      () => _i4.AuthRepository(dataSource: get<_i3.AuthDataSource>()));
  gh.lazySingleton<_i5.FavoriteHostDataSource>(
      () => _i5.FavoriteHostDataSource());
  gh.lazySingleton<_i6.FavoriteHostRepository>(() => _i6.FavoriteHostRepository(
      dataSource: get<_i5.FavoriteHostDataSource>()));
  gh.lazySingleton<_i7.HostDataSource>(() => _i7.HostDataSource());
  gh.lazySingleton<_i8.HostRepository>(
      () => _i8.HostRepository(dataSource: get<_i7.HostDataSource>()));
  gh.lazySingleton<_i9.LocationDataSource>(() => _i9.LocationDataSource());
  gh.lazySingleton<_i10.LocationRepository>(
      () => _i10.LocationRepository(dataSource: get<_i9.LocationDataSource>()));
  gh.lazySingleton<_i11.ProfileDataSource>(() => _i11.ProfileDataSource());
  gh.lazySingleton<_i12.ProfileRepository>(() =>
      _i12.ProfileRepository(profileDataSource: get<_i11.ProfileDataSource>()));
  gh.lazySingleton<_i13.VerifyAuthLocalDataSource>(
      () => _i13.VerifyAuthLocalDataSource());
  gh.lazySingleton<_i14.VeriryAuthRemoteDataSource>(
      () => _i14.VeriryAuthRemoteDataSource());
  gh.lazySingleton<_i15.VeriryAuthRepository>(() => _i15.VeriryAuthRepository(
        remoteDataSource: get<_i14.VeriryAuthRemoteDataSource>(),
        localDataSource: get<_i13.VerifyAuthLocalDataSource>(),
      ));
  return get;
}
