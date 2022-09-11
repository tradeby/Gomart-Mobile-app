// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:algolia/algolia.dart' as _i3;
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/bloc/authentication/authentication_bloc.dart' as _i14;
import 'data/repository/Product/IProductRepository.dart' as _i8;
import 'data/repository/Product/ProductRepository.dart' as _i9;
import 'data/repository/User/IUserRepository.dart' as _i10;
import 'data/repository/User/UserRepository.dart' as _i11;
import 'screens/Authentication/Login/bloc/login_cubit.dart' as _i12;
import 'screens/Authentication/Register/bloc/registration_cubit.dart' as _i13;
import 'screens/debug/bloc/debug_cubit.dart' as _i15;
import 'screens/Home/Screens/HomeFragment/bloc/home_cubit.dart' as _i16;
import 'service/app_module.dart' as _i17;
import 'service/firebase_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factory<_i3.Algolia>(() => appModule.algolia);
  gh.factory<_i4.FirebaseAuth>(() => appModule.auth);
  gh.factory<_i5.FirebaseFirestore>(() => appModule.store);
  await gh.factoryAsync<_i6.FirebaseService>(() => appModule.fireService,
      preResolve: true);
  gh.factory<_i7.FirebaseStorage>(() => appModule.storage);
  gh.factory<_i8.IProductRepository>(
      () => _i9.ProductRepository(get<_i5.FirebaseFirestore>()));
  gh.factory<_i10.IUserRepository>(() => _i11.UserRepository(
      get<_i4.FirebaseAuth>(),
      get<_i5.FirebaseFirestore>(),
      get<_i7.FirebaseStorage>()));
  gh.factory<_i12.LoginCubit>(() =>
      _i12.LoginCubit(get<_i4.FirebaseAuth>(), get<_i10.IUserRepository>()));
  gh.factory<_i13.RegistrationCubit>(() => _i13.RegistrationCubit(
      get<_i4.FirebaseAuth>(), get<_i10.IUserRepository>()));
  gh.factory<_i14.AuthenticationBloc>(
      () => _i14.AuthenticationBloc(get<_i10.IUserRepository>()));
  gh.factory<_i15.DebugCubit>(
      () => _i15.DebugCubit(get<_i8.IProductRepository>()));
  gh.factory<_i16.HomeCubit>(
      () => _i16.HomeCubit(get<_i8.IProductRepository>()));
  return get;
}

class _$AppModule extends _i17.AppModule {}
