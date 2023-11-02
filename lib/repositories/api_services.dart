import 'package:http/http.dart' as http;

import '../resources/constants_manager.dart';

class ApiServices {
  static Future<http.Response> get(String apiName) async {
    final String url = '${DotenvManager.apiPath}/$apiName';
    http.Response response = await http
        .get(
      Uri.parse(url),
    )
        .timeout(
      ConstantsManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ConstantsManager.timedOutErrorException, 408);
      },
    );
    return response;
  }

  static Future<http.Response> post({
    required String apiName,
    required String body,
  }) async {
    final String url = '${DotenvManager.apiPath}/$apiName';
    http.Response response = await http
        .post(
      Uri.parse(url),
      body: body,
    )
        .timeout(
      ConstantsManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ConstantsManager.timedOutErrorException, 408);
      },
    );
    return response;
  }

  static Future<http.Response> put({
    required String apiName,
    required body,
  }) async {
    final String url = '${DotenvManager.apiPath}/$apiName';
    http.Response response = await http
        .put(
      Uri.parse(url),
      body: body,
    )
        .timeout(
      ConstantsManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ConstantsManager.timedOutErrorException, 408);
      },
    );
    return response;
  }

  static Future<http.Response> delete(
    String apiName,
  ) async {
    final String url = '${DotenvManager.apiPath}/$apiName';
    http.Response response = await http
        .delete(
      Uri.parse(url),
    )
        .timeout(
      ConstantsManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ConstantsManager.timedOutErrorException, 408);
      },
    );
    return response;
  }
}
