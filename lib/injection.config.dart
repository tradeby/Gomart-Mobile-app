// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:algolia/algolia.dart' as _i3;
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart'
    as _i16;
import 'package:gomart/data/repository/Product/IProductRepository.dart' as _i9;
import 'package:gomart/data/repository/Product/ProductRepository.dart' as _i10;
import 'package:gomart/data/repository/User/IUserRepository.dart' as _i11;
import 'package:gomart/data/repository/User/UserRepository.dart' as _i12;
import 'package:gomart/screens/Authentication/Login/bloc/login_cubit.dart'
    as _i13;
import 'package:gomart/screens/Authentication/Register/bloc/registration_cubit.dart'
    as _i14;
import 'package:gomart/screens/debug/bloc/debug_cubit.dart' as _i17;
import 'package:gomart/screens/Home/Screens/Account/EditBusiness/bloc/business_cubit.dart'
    as _i4;
import 'package:gomart/screens/Home/Screens/Home/bloc/home_cubit.dart' as _i18;
import 'package:gomart/screens/Search/bloc/search_cubit.dart' as _i15;
import 'package:gomart/service/app_module.dart' as _i19;
import 'package:gomart/service/firebase_service.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.Algolia>(() => appModule.algolia);
  gh.factory<_i4.BusinessCubit>(() => _i4.BusinessCubit());
  gh.factory<_i5.FirebaseAuth>(() => appModule.auth);
  gh.factory<_i6.FirebaseFirestore>(() => appModule.store);
  await gh.factoryAsync<_i7.FirebaseService>(
    () => appModule.fireService,
    preResolve: true,
  );
  gh.factory<_i8.FirebaseStorage>(() => appModule.storage);
  gh.factory<_i9.IProductRepository>(() => _i10.ProductRepository(
        gh<_i6.FirebaseFirestore>(),
        gh<_i3.Algolia>(),
      ));
  gh.factory<_i11.IUserRepository>(() => _i12.UserRepository(
        gh<_i5.FirebaseAuth>(),
        gh<_i6.FirebaseFirestore>(),
        gh<_i8.FirebaseStorage>(),
      ));
  gh.factory<_i13.LoginCubit>(() => _i13.LoginCubit(
        gh<_i5.FirebaseAuth>(),
        gh<_i11.IUserRepository>(),
      ));
  gh.factory<_i14.RegistrationCubit>(() => _i14.RegistrationCubit(
        gh<_i5.FirebaseAuth>(),
        gh<_i11.IUserRepository>(),
      ));
  gh.factory<_i15.SearchCubit>(
      () => _i15.SearchCubit(gh<_i9.IProductRepository>()));
  gh.factory<_i16.AuthenticationBloc>(
      () => _i16.AuthenticationBloc(gh<_i11.IUserRepository>()));
  gh.factory<_i17.DebugCubit>(
      () => _i17.DebugCubit(gh<_i9.IProductRepository>()));
  gh.factory<_i18.HomeCubit>(
      () => _i18.HomeCubit(gh<_i9.IProductRepository>()));
  return getIt;
}

class _$AppModule extends _i19.AppModule {}
