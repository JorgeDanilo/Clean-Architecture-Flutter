import 'package:clean_architecture/core/app_result.dart';
import 'package:clean_architecture/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
@RegisterAs(GetUserUseCase)
class GetUsersCase implements GetUserUseCase {
  final UserRepository repository;

  GetUsersCase(this.repository);

  @override
  Future<AppResult> execute() async {
    final response = await repository.getUsers();
    return response;
  }
}

abstract class GetUserUseCase {
  Future<AppResult> execute();
}