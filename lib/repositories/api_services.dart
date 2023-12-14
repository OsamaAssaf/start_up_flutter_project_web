import 'package:http/http.dart' as http;

import '../resources/constants_manager.dart';
import '../resources/exception_manager.dart';

class ApiServices {
  static Future<http.Response> get(String subLink) async {
    final String url = '${DotenvManager.apiPath}/$subLink';
    http.Response response = await http
        .get(
      Uri.parse(url),
    )
        .timeout(
      ExceptionManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutErrorException, 408);
      },
    );
    return response;
  }

  static Future<http.Response> post({
    required String subLink,
    required String body,
  }) async {
    final String url = '${DotenvManager.apiPath}/$subLink';
    http.Response response = await http
        .post(
      Uri.parse(url),
      body: body,
    )
        .timeout(
      ExceptionManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutErrorException, 408);
      },
    );
    return response;
  }

  static Future<http.Response> put({
    required String subLink,
    required body,
  }) async {
    final String url = '${DotenvManager.apiPath}/$subLink';
    http.Response response = await http
        .put(
      Uri.parse(url),
      body: body,
    )
        .timeout(
      ExceptionManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutErrorException, 408);
      },
    );
    return response;
  }

  static Future<http.Response> delete(String subLink) async {
    final String url = '${DotenvManager.apiPath}/$subLink';
    http.Response response = await http
        .delete(
      Uri.parse(url),
    )
        .timeout(
      ExceptionManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutErrorException, 408);
      },
    );
    return response;
  }
}
