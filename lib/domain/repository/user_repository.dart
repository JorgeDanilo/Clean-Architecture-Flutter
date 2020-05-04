import 'package:clean_architecture/core/app_result.dart';

abstract class UserRepository {
  Future<AppResult> getUsers();
}
