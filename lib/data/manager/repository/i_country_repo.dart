import 'package:country_app/data/services/api/country/model/country_list_model.dart';

abstract class ICountryRepo {
  Future<List<CountryListModel>> fetchCountryList();
}
