// import 'package:country_app/data/controller/generic_state_notifier.dart';
// import 'package:country_app/data/manager/repository/country_repo.dart';
// import 'package:country_app/data/services/api/country/model/country_list_model.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final filterByRegionProvider = StateNotifierProvider<
//     FilterByRegionVM,
//     RequestState<List<CountryListModel>>,
//     String>((ref, region) => FilterByRegionVM(ref));

// class FilterByRegionVM extends RequestStateNotifier<List<CountryListModel>> {
//   final CountryRepo _countryRepo;
//   FilterByRegionVM(Ref ref) : _countryRepo = ref.read(countryRepoProvider);
//   //  {
//   //   filterByRegion('');
//   // }
//   Future<RequestState<List<CountryListModel>>> filterByRegion(String region) =>
//       makeRequest(() => _countryRepo.filterByRegion(region));
// }
