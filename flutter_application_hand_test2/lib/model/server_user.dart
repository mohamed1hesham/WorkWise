import 'package:http/http.dart' as http;

class ServerUserAPI {
  static const String API_URL = 'https://handworke.000webhostapp.com/Api_users/User_api.php';
  static const String INSERT_USER_ACTION = 'INSERT_USER';

static Future<String> insertUser(
      String firstName,
      String lastName,
      String country,
      String city,
      String idNumber,
      String nationalId,
      String password,
      String userType, // تمت إضافة المعامل هنا
      String job) async {
    try {
      var map = {
        'action': INSERT_USER_ACTION,
        'first_name': firstName,
        'last_name': lastName,
        'country': country,
        'city': city,
        'id_number': idNumber,
        'national_id': nationalId,
        'password': password,
        'user_type': userType, // تمت إضافة تعيين نوع المستخدم هنا
        'job': job
      };
      final response = await http.post(Uri.parse(API_URL), body: map);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'Error: ${response.reasonPhrase}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  static Future<String> checkUser(String nationalId,String password,String userType) async{
     var map = {
        'national_id': nationalId,
        'password': password,};
      final response = await http.post(Uri.parse(API_URL), body: map);
    if (response.statusCode == 200) {
      
       return 'login succesfully';
      } else {
        return 'Error: ${response.reasonPhrase}';
      }
      
  }

}
