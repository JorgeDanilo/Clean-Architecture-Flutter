import 'package:clean_architecture/core/app_result.dart';
import 'package:clean_architecture/core/app_state.dart';
import 'package:clean_architecture/core/bloc.dart';
import 'package:clean_architecture/domain/model/user.dart';
import 'package:clean_architecture/domain/use_case/get_user_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc {
  final GetUserUseCase usersUseCase;

  HomeBloc(this.usersUseCase);

  void getUsers() async {
    streamController.sink.add(Loading());
    final response = await usersUseCase.execute();
    switch (response.status) {
      case Status.SUCCESS:
        streamController.sink.add(Success(response.data));
        break;
      case Status.FAILURE:
        streamController.sink.add(Failure(response.message));
        break;
    }
  }
}

abstract class HomeState extends AppState {}

class OnGetUsers extends HomeState {
  List<User> users;

  OnGetUsers(this.users);
}