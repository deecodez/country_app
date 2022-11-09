import 'package:country_app/data/manager/repository/country_repo.dart';
import 'package:country_app/data/services/api/country/model/country_list_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fetchCountryListVm = FutureProvider<List<CountryListModel>>((ref) async {
  final _coutryListManager = ref.read(countryRepoProvider);

  return await _coutryListManager.fetchCountryList();
});
