import 'package:clean_architecture/core/app_result.dart';
import 'package:clean_architecture/data/remote/user_remote_data_source.dart';
import 'package:clean_architecture/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
@RegisterAs(UserRepository)
class AppUserRepository implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  AppUserRepository(this.userRemoteDataSource);

  @override
  Future<AppResult> getUsers() => userRemoteDataSource.getUsers();

}