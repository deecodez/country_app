import 'package:country_app/data/constant/constant.dart';
import 'package:country_app/data/services/api/api_interceptor.dart';
import 'package:country_app/data/services/api/country/model/country_list_model.dart';
import 'package:country_app/data/services/api/erorr_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final countryServiceProvider = Provider<CountryService>((ref) {
  return CountryService((ref.read));
});

final dioProvider = Provider((ref) => Dio(BaseOptions(
      receiveTimeout: 100000,
      connectTimeout: 100000,
      baseUrl: Constants.apiBaseUrl,
    )));

class CountryService {
  final Reader _read;
  CountryService(this._read) {
    _read(dioProvider).interceptors.add(ApiInterceptor());
    _read(dioProvider).interceptors.add(ErrorInterceptor());
    _read(dioProvider).interceptors.add(PrettyDioLogger());
  }

  Future<List<CountryListModel>> fetchCountryList() async {
    const url = 'all';
    try {
      final response = await _read(dioProvider).get(url);
      // final result = response.data['result'];
      return countryListModelFromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.error.message;
      } else {
        throw e.message;
      }
    }
  }
}
