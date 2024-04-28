import '../resources/helpers/all_imports.dart';
import '../resources/helpers/conflict_imports.dart' as http;

class ApiServices {
  static Future<http.Response> get(String endPoint) async {
    final String url = '${DotenvManager.apiPath}/$endPoint';
    http.Response response = await http
        .get(
      Uri.parse(url),
    )
        .timeout(
      ExceptionManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    ExceptionManager().checkTimedOut(response.statusCode);
    return response;
  }

  static Future<http.Response> post({
    required String endPoint,
    required String body,
  }) async {
    final String url = '${DotenvManager.apiPath}/$endPoint';
    http.Response response = await http
        .post(
      Uri.parse(url),
      body: body,
    )
        .timeout(
      ExceptionManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    ExceptionManager().checkTimedOut(response.statusCode);
    return response;
  }

  static Future<http.Response> put({
    required String endPoint,
    required body,
  }) async {
    final String url = '${DotenvManager.apiPath}/$endPoint';
    http.Response response = await http
        .put(
      Uri.parse(url),
      body: body,
    )
        .timeout(
      ExceptionManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    ExceptionManager().checkTimedOut(response.statusCode);
    return response;
  }

  static Future<http.Response> delete(String endPoint) async {
    final String url = '${DotenvManager.apiPath}/$endPoint';
    http.Response response = await http
        .delete(
      Uri.parse(url),
    )
        .timeout(
      ExceptionManager.timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    ExceptionManager().checkTimedOut(response.statusCode);
    return response;
  }
}
