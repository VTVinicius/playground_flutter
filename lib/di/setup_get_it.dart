import 'package:get_it/get_it.dart';
import 'package:playground_flutter/core/network.dart';
import 'package:playground_flutter/data/data_local/database/AddressDAO.dart';
import 'package:playground_flutter/data/data_local/database/database_helper.dart';
import 'package:playground_flutter/data/data_local/datasource/address_local_repository.dart';
import 'package:playground_flutter/data/data_local/datasource/address_local_repository_impl.dart';
import 'package:playground_flutter/data/data_local/shared_preferences/datasource/address_preferences_repository.dart';
import 'package:playground_flutter/data/data_local/shared_preferences/datasource/address_preferences_repository_impl.dart';
import 'package:playground_flutter/data/data_local/shared_preferences/preferences_helper.dart';
import 'package:playground_flutter/data/data_remote/datasource/ViaCepDataSource.dart';
import 'package:playground_flutter/data/data_remote/repository/address_repository.dart';
import 'package:playground_flutter/data/data_remote/repository/address_repository_impl.dart';
import 'package:playground_flutter/domain/usecase/address/get_address_usecase.dart';
import 'package:playground_flutter/domain/usecase/address/get_last_cep_usecase.dart';
import 'package:playground_flutter/domain/usecase/address/save_address_usecase.dart';
import 'package:playground_flutter/domain/usecase/address/save_last_cep_usecase.dart';

import '../domain/usecase/address/get_all_addresses_usecase.dart';
import '../presentation/features_features/feature_address/address/address_view_model.dart';
import '../presentation/features_features/feature_address/history/history_viewmodel.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  domainModule();
  dataModule();
  repositoryModule();
  viewModelModule();
}

void dataModule() {
  getIt.registerSingleton<DatabaseHelper>(DatabaseHelper.instance);
  getIt.registerSingleton<NetworkManager>(NetworkManager());
  getIt.registerSingleton<PreferencesHelper>(PreferencesHelper());

  getIt.registerSingleton<ViaCepDataSource>(ViaCepDataSource(NetworkManager()));
  getIt.registerSingleton<AddressDAO>(AddressDAO(DatabaseHelper.instance));
}

void repositoryModule() {
  // Registra os repositórios

  getIt.registerSingleton<AddressRepository>(AddressRepositoryImpl(
      viaCepDataSource: ViaCepDataSource(NetworkManager())));

  getIt.registerSingleton<AddressLocalRepository>(AddressLocalRepositoryImpl(
      addressDAO: AddressDAO(DatabaseHelper.instance)));

  getIt.registerSingleton<AddressPreferencesRepository>(AddressPreferencesRepositoryImpl(
      preferencesHelper: PreferencesHelper()));
}

void viewModelModule() {
  getIt.registerFactory<AddressViewModel>(() => AddressViewModel(
        getIt.get<GetAddressUseCase>(),
        getIt.get<SaveAddressUseCase>(),
        getIt.get<GetLastCEPUseCase>(),
        getIt.get<SaveLastCEPUseCase>(),
      ));

  getIt.registerFactory<HistoryViewModel>(() => HistoryViewModel(
        getIt.get<GetAllAddressesUseCase>(),
      ));
}

void domainModule() {
  getIt.registerFactory<GetAddressUseCase>(
      () => GetAddressUseCase(getIt<AddressRepository>()));

  getIt.registerFactory<GetAllAddressesUseCase>(
      () => GetAllAddressesUseCase(getIt<AddressLocalRepository>()));

  getIt.registerFactory<SaveAddressUseCase>(
      () => SaveAddressUseCase(getIt<AddressLocalRepository>()));

  getIt.registerFactory<SaveLastCEPUseCase>(
      () => SaveLastCEPUseCase(getIt<AddressPreferencesRepository>()));

  getIt.registerFactory<GetLastCEPUseCase>(
      () => GetLastCEPUseCase(getIt<AddressPreferencesRepository>()));
}
