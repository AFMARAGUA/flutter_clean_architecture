import 'package:practice_flutter_maragua/home/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<User> getUser(int id);
  Future<User> saveUser(User user);
}
