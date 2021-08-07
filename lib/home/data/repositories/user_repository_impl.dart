import 'package:practice_flutter_maragua/home/data/datasources/database_helpers.dart';
import 'package:practice_flutter_maragua/home/domain/entities/user_entity.dart';
import 'package:practice_flutter_maragua/home/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> getUser(int id) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    final User user = await helper.queryUser(id);
    return user;
  }

  @override
  Future<User> saveUser(User user) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    await helper.insert(user);
    return user;
  }
}
