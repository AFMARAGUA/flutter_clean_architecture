import 'package:practice_flutter_maragua/home/domain/entities/user_entity.dart';

abstract class UserService {
  Future<List<User>> getUsers();
  Future<User> getUser(int id);
  Future<bool> createUser(Map body);
}
