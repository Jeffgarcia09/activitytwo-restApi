import 'package:activitytwo/model/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  late http.Client client;

  UserRepository(this.client);

  Future<User> fetchUserApi() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      return User();
    } else {
      throw Exception();
    }
  }
}
