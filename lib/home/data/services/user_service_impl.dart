import 'package:practice_flutter_maragua/home/domain/entities/user_entity.dart';
import 'package:practice_flutter_maragua/home/domain/services/user_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserServiceImpl implements UserService {
  final String _url = "https://reqres.in/api/users";
  @override
  Future<List<User>> getUsers() async {
    List<User> list = [];
    Uri url = Uri.parse(_url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonDecode = json.decode(utf8.decode(response.bodyBytes));
      list = (jsonDecode["data"] as List)
          .map((res) => User.fromJson(res))
          .toList();
    }
    return list;
  }

  @override
  Future<User> getUser(int id) async {
    User user = User(id: 0, avatar: '', email: '', firstName: '', lastName: '');
    Uri url = Uri.parse('$_url/$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonDecode = json.decode(utf8.decode(response.bodyBytes));
      user = User.fromJson(jsonDecode["data"]);
    }
    return user;
  }

  @override
  Future<bool> createUser(Map body) async {
    Uri url = Uri.parse(_url);
    bool createSuccess = false;
    var response = await http.post(
      url,
      body: body,
    );
    if (response.statusCode == 201) createSuccess = true;
    return createSuccess;
  }
}
