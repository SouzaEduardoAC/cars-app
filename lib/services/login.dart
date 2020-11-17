import 'dart:convert';
import 'package:carsapp/application_config.dart';
import 'package:carsapp/models/user.dart';
import 'package:carsapp/utils/api_response.dart';
import 'package:http/http.dart' as http;


class LoginService {
  static Future<ApiResponse<User>> login(String login, String password) async {
    final url = "$carsUrlBase/v2/login";

    final Map params = {
      'username': login,
      'password': password,
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };


   try{
     final response = await http.post(
       url,
       body: json.encode(params),
       headers: headers,
     );

     final mapResponse = json.decode(response.body);

     print('Response body: ${response.body}');

     if (response.statusCode == 200)
     {
       final user = User.fromJson(mapResponse);
       user.save();
       return ApiResponse.success(user);
     }
     return ApiResponse.error(mapResponse['error']);
   } catch(error, exception) {
      print('>>> Login error : $error > $exception');
      ApiResponse.error("Couldn't connect to server");
   }
  }
}
