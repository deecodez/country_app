import 'package:country_app/data/services/api/country/model/country_list_model.dart';

abstract class ICountryRepo {
  Future<List<CountryListModel>> fetchCountryList();
  Future<List<CountryListModel>> filterByRegion(String region);
  Future<List<CountryListModel>> filterByCurrency(String currency);
  Future<List<CountryListModel>> filterBySubRegion(String subRegion);
}
