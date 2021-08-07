import 'package:get/get.dart';
import 'package:practice_flutter_maragua/home/data/repositories/user_repository_impl.dart';
import 'package:practice_flutter_maragua/home/data/services/user_service_impl.dart';
import 'package:practice_flutter_maragua/home/domain/repositories/user_repository.dart';
import 'package:practice_flutter_maragua/home/domain/services/user_service.dart';

class MainBainding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl());
    Get.lazyPut<UserService>(() => UserServiceImpl());
  }
}
