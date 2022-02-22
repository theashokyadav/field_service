import 'package:http/http.dart' as http;
import 'package:field_service/user_model.dart';
import 'user_model.dart';


class Services {
  //
  static const String url = 'http://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (200 == response.statusCode) {
        final List<User> users = userFromJson(response.body);
        return users;
      } else {
        return <User>[];
      }
    } catch (e) {
      return <User>[];
    }
  }
}