// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/bloc/authentication/authentication_bloc.dart' as _i11;
import 'data/repository/User/IUserRepository.dart' as _i7;
import 'data/repository/User/UserRepository.dart' as _i8;
import 'screens/Authentication/Login/bloc/login_cubit.dart' as _i9;
import 'screens/Authentication/Register/bloc/registration_cubit.dart' as _i10;
import 'service/app_module.dart' as _i12;
import 'service/firebase_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factory<_i3.FirebaseAuth>(() => appModule.auth);
  gh.factory<_i4.FirebaseFirestore>(() => appModule.store);
  await gh.factoryAsync<_i5.FirebaseService>(() => appModule.fireService,
      preResolve: true);
  gh.factory<_i6.FirebaseStorage>(() => appModule.storage);
  gh.factory<_i7.IUserRepository>(() => _i8.UserRepository(
      get<_i3.FirebaseAuth>(),
      get<_i4.FirebaseFirestore>(),
      get<_i6.FirebaseStorage>()));
  gh.factory<_i9.LoginCubit>(() =>
      _i9.LoginCubit(get<_i3.FirebaseAuth>(), get<_i7.IUserRepository>()));
  gh.factory<_i10.RegistrationCubit>(() => _i10.RegistrationCubit(
      get<_i3.FirebaseAuth>(), get<_i7.IUserRepository>()));
  gh.factory<_i11.AuthenticationBloc>(
      () => _i11.AuthenticationBloc(get<_i7.IUserRepository>()));
  return get;
}

class _$AppModule extends _i12.AppModule {}
