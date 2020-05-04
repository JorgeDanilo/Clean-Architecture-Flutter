import 'package:clean_architecture/data/http_manager/http_manager.dart';
import 'package:clean_architecture/data/service/user_remote_service.dart';
import 'package:injectable/injectable.dart';

@injectable
@Named('default')
@RegisterAs(UserRemoteService)
class AppUserRemoteService implements UserRemoteService {
  final HttpManager httpManager;

  AppUserRemoteService(this.httpManager);

  @override
  Future getUsers() async =>
      await httpManager.get(url: '/users', query: {'page': 1});
}
