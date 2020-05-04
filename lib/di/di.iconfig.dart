// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:clean_architecture/data/http_manager/app_http_manager.dart';
import 'package:clean_architecture/data/http_manager/http_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clean_architecture/di/di_module.dart';
import 'package:clean_architecture/data/service/app_user_remote_service.dart';
import 'package:clean_architecture/data/service/user_remote_service.dart';
import 'package:clean_architecture/data/remote/app_user_remote_data_source.dart';
import 'package:clean_architecture/data/remote/user_remote_data_source.dart';
import 'package:clean_architecture/data/repository/app_user_repository.dart';
import 'package:clean_architecture/domain/repository/user_repository.dart';
import 'package:clean_architecture/domain/use_case/get_user_use_case.dart';
import 'package:clean_architecture/ui/home_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final serviceModule = _$ServiceModule();
  g.registerFactory<HttpManager>(() => AppHttpManager());
  g.registerFactory<UserRemoteService>(
      () => AppUserRemoteService(g<HttpManager>()),
      instanceName: 'default');
  g.registerFactory<UserRemoteDataSource>(() =>
      AppUserRemoteDataSource(g<UserRemoteService>('default')));
  g.registerFactory<UserRepository>(
      () => AppUserRepository(g<UserRemoteDataSource>()));
  g.registerFactory<GetUserUseCase>(() => GetUsersCase(g<UserRepository>()));
  g.registerFactory<HomeBloc>(() => HomeBloc(g<GetUserUseCase>()));
}

class _$ServiceModule extends ServiceModule {}
