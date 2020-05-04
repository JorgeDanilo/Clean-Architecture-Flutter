import 'package:clean_architecture/core/app_result.dart';
import 'package:clean_architecture/data/mapper/user_remote_mappers.dart';
import 'package:clean_architecture/data/remote/user_remote_data_source.dart';
import 'package:clean_architecture/data/response/user_response.dart';
import 'package:clean_architecture/data/service/user_remote_service.dart';
import 'package:clean_architecture/domain/exception/app_exceptions.dart';
import 'package:clean_architecture/domain/model/user.dart';
import 'package:injectable/injectable.dart';

@injectable
@RegisterAs(UserRemoteDataSource)
class AppUserRemoteDataSource implements UserRemoteDataSource {

  final UserRemoteService _remote;

  AppUserRemoteDataSource(@Named('default') this._remote);

  @override
  Future<AppResult> getUsers() async {
    try {
      var users = await _remote.getUsers();
      var userResponse = users.map((el) => UsersResponse.fromJson(el)).toList();
      return AppResult.success(userResponse);
    } on AppException catch (error) {
      return AppResult.failure(error.message);
    } catch (e) {
      return AppResult.failure();
    }
  }

}