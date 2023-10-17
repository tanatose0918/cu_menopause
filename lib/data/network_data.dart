import 'dart:convert' as convertor;
import 'package:http/http.dart' as http;

var url = Uri.https('jsonplaceholder.typicode.com', '/users');

abstract class NetworkDataRepository {
  // Future getAllUsers();
  // Future<List<User>> getAllUsers();
  // Future<User> getUserByUsername({required String username});
}

class NetworkDataRestfulApi extends NetworkDataRepository {
  void getAllUsers() async {
    var response = await http.get(url);

    print(response);

    if (response.statusCode == 200) {
      var jsonResponse =
          convertor.jsonDecode(response.body) as Map<String, dynamic>;
      // var itemCount = jsonResponse['totalItems'];
      print('can get User data: $jsonResponse.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  // @override
  // Future<List<User>> getAllUsers() async {
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var jsonResponse =
  //         convertor.jsonDecode(response.body) as Map<String, dynamic>;
  //     var itemCount = jsonResponse['totalItems'];
  //     print('Number of books about http: $itemCount.');
  //   }else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  //   return;
  // }

  // @override
  // Future<User> getUserByUsername() async {
  //   return;
  // }
}
