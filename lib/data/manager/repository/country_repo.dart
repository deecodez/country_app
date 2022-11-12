import 'package:country_app/data/manager/repository/i_country_repo.dart';
import 'package:country_app/data/services/api/country/country_service.dart';
import 'package:country_app/data/services/api/country/model/country_list_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countryRepoProvider = Provider<CountryRepo>((ref) {
  final countryService = ref.watch(countryServiceProvider);
  return CountryRepo(countryService);
});

class CountryRepo extends ICountryRepo {
  final CountryService _countryService;
  CountryRepo(this._countryService);

  @override
  Future<List<CountryListModel>> fetchCountryList() async {
    return _countryService.fetchCountryList();
  }

  @override
  Future<List<CountryListModel>> filterByCurrency(String currency) async {
    return _countryService.filterByCurrency(currency);
  }

  @override
  Future<List<CountryListModel>> filterByRegion(String region) async {
    return _countryService.filterByRegion(region);
  }

  @override
  Future<List<CountryListModel>> filterBySubRegion(String subRegion) async {
    return _countryService.filterBySubRegion(subRegion);
  }
}
