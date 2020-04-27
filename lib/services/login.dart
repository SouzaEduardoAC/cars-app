import 'dart:convert';

import 'package:carsapp/models/user.dart';
import 'package:carsapp/utils/api_response.dart';
import 'package:http/http.dart' as http;

final baseUrl = 'http://carros-springboot.herokuapp.com/api';

class LoginService {
  static Future<ApiResponse<User>> login(String login, String password) async {
    final url = "$baseUrl/v2/login";

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

     ApiResponse<User> loginResponse = response.statusCode == 200
         ? ApiResponse.success(User.fromJson(mapResponse))
         : ApiResponse.error(mapResponse['error']);

     return loginResponse;
   } catch(error, exception) {
      print('>>> Login error : $error > $exception');
      ApiResponse.error("Couldn't connect to server");
   }
  }
}
