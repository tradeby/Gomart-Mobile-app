// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:algolia/algolia.dart' as _i3;
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:gomart/data/bloc/authentication/authentication_bloc.dart'
    as _i17;
import 'package:gomart/data/repository/Business/BusinessRepository.dart' as _i9;
import 'package:gomart/data/repository/Business/IBusinessRepository.dart'
    as _i8;
import 'package:gomart/data/repository/Product/IProductRepository.dart' as _i10;
import 'package:gomart/data/repository/Product/ProductRepository.dart' as _i11;
import 'package:gomart/data/repository/User/IUserRepository.dart' as _i12;
import 'package:gomart/data/repository/User/UserRepository.dart' as _i13;
import 'package:gomart/screens/Authentication/Login/bloc/login_cubit.dart'
    as _i14;
import 'package:gomart/screens/Authentication/Register/bloc/registration_cubit.dart'
    as _i15;
import 'package:gomart/screens/debug/bloc/debug_cubit.dart' as _i19;
import 'package:gomart/screens/Home/Screens/Account/EditBusiness/bloc/business_cubit.dart'
    as _i18;
import 'package:gomart/screens/Home/Screens/Home/bloc/home_cubit.dart' as _i20;
import 'package:gomart/screens/Search/bloc/search_cubit.dart' as _i16;
import 'package:gomart/service/app_module.dart' as _i21;
import 'package:gomart/service/firebase_service.dart' as _i6;
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
  gh.factory<_i4.FirebaseAuth>(() => appModule.auth);
  gh.factory<_i5.FirebaseFirestore>(() => appModule.store);
  await gh.factoryAsync<_i6.FirebaseService>(
    () => appModule.fireService,
    preResolve: true,
  );
  gh.factory<_i7.FirebaseStorage>(() => appModule.storage);
  gh.factory<_i8.IBusinessRepository>(() => _i9.FirebaseBusinessRepository(
        gh<_i5.FirebaseFirestore>(),
        gh<_i7.FirebaseStorage>(),
      ));
  gh.factory<_i10.IProductRepository>(() => _i11.ProductRepository(
        gh<_i5.FirebaseFirestore>(),
        gh<_i3.Algolia>(),
      ));
  gh.factory<_i12.IUserRepository>(() => _i13.UserRepository(
        gh<_i4.FirebaseAuth>(),
        gh<_i5.FirebaseFirestore>(),
        gh<_i7.FirebaseStorage>(),
      ));
  gh.factory<_i14.LoginCubit>(() => _i14.LoginCubit(
        gh<_i4.FirebaseAuth>(),
        gh<_i12.IUserRepository>(),
      ));
  gh.factory<_i15.RegistrationCubit>(() => _i15.RegistrationCubit(
        gh<_i4.FirebaseAuth>(),
        gh<_i12.IUserRepository>(),
      ));
  gh.factory<_i16.SearchCubit>(
      () => _i16.SearchCubit(gh<_i10.IProductRepository>()));
  gh.factory<_i17.AuthenticationBloc>(
      () => _i17.AuthenticationBloc(gh<_i12.IUserRepository>()));
  gh.factory<_i18.BusinessCubit>(
      () => _i18.BusinessCubit(gh<_i8.IBusinessRepository>()));
  gh.factory<_i19.DebugCubit>(
      () => _i19.DebugCubit(gh<_i10.IProductRepository>()));
  gh.factory<_i20.HomeCubit>(
      () => _i20.HomeCubit(gh<_i10.IProductRepository>()));
  return getIt;
}

class _$AppModule extends _i21.AppModule {}
