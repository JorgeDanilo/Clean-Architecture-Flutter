import 'package:clean_architecture/data/response/user_response.dart';
import 'package:clean_architecture/domain/model/user.dart';

User mapUserResponseToUser(UsersResponse response) => User (
  id: response.id,
  email: response.email,
  firstName: response.firstName,
  lastName: response.lastName,
  avatar:  response.avatar,
);