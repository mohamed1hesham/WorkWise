import 'package:http/http.dart' as http;

class ServerWorkerAPI {
  static const String API_URL = 'https://handworke.000webhostapp.com/Api_worker/worker_api.php';
  static const String INSERT_WORKER_ACTION = 'INSERT_USER'; // تم تعديل اسم الفعل

  static Future<String> insertWorker(
      String firstName,
      String lastName,
      String country,
      String city,
      String idNumber,
      String nationalId, // إضافة حقل الـ National ID هنا
      String job,
      String password) async {
    try {
      var map = {
        'action': INSERT_WORKER_ACTION,
        'first_name': firstName,
        'last_name': lastName,
        'country': country,
        'city': city,
        'id_number': idNumber,
        'national_id': nationalId, // إضافة الـ National ID هنا
        'jop_worker': job,
        'password': password
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
}
