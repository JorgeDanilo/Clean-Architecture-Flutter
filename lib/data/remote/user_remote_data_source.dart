import 'package:clean_architecture/core/app_result.dart';

abstract class UserRemoteDataSource {
  Future<AppResult> getUsers();
}