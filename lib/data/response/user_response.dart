import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UsersResponse {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UsersResponse(
      {this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory UsersResponse.fromJson(Map<String, dynamic> parsedJson) {
    return UsersResponse(
        id: parsedJson['id'],
        email: parsedJson['email'],
        firstName: parsedJson['first_name'],
        lastName: parsedJson['last_name'],
        avatar: parsedJson['avatar']);
  }
}
