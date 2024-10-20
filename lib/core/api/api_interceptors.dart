import 'package:dio/dio.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/cache/cache_helper.dart';


class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers[ApiKeys.token] = CacheHelper().getData(key: ApiKeys.token) != null
    //     ? 'FOODAPI ${CacheHelper().getData(key: ApiKeys.token)}'
    //     : null;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
