import 'package:http/http.dart' as http;

class Services {
  static const String API_URL =
      'https://handworke.000webhostapp.com/api_All_User_app/AllUser_api.php';
  static const String CREATE_TABLE_ACTION = 'CREATE_TABLE_LOGIN';
  static const String INSERT_USER_CREDENTIALS_ACTION = 'INSERT_USER_CREDENTIALS';

  static Future<String> createTable() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = CREATE_TABLE_ACTION;
      final response = await http.post(Uri.parse(API_URL), body: map);
      print('Create table response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> insertUserCredentials(String username, String password) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = INSERT_USER_CREDENTIALS_ACTION;
      map['username'] = username;
      map['password'] = password;
      final response = await http.post(Uri.parse(API_URL), body: map);
      print('Insert user credentials response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }
}
