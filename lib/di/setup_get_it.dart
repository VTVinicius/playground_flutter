import 'package:get_it/get_it.dart';
import 'package:playground_flutter/core/network.dart';
import 'package:playground_flutter/data/data_local/database/AddressDAO.dart';
import 'package:playground_flutter/data/data_local/database/database_helper.dart';
import 'package:playground_flutter/data/data_local/datasource/address_local_repository.dart';
import 'package:playground_flutter/data/data_local/datasource/address_local_repository_impl.dart';
import 'package:playground_flutter/data/data_remote/datasource/ViaCepDataSource.dart';
import 'package:playground_flutter/data/data_remote/repository/address_repository.dart';
import 'package:playground_flutter/data/data_remote/repository/address_repository_impl.dart';
import 'package:playground_flutter/presentation/features_features/feture_address/address/address_view_model.dart';
import 'package:playground_flutter/presentation/features_features/feture_address/history/history_viewmodel.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  dataModule();
  repositoryModule();
  viewModelModule();
}

void dataModule() {
  getIt.registerSingleton<NetworkManager>(NetworkManager());
  getIt.registerSingleton<DatabaseHelper>(DatabaseHelper());

  getIt.registerSingleton<ViaCepDataSource>(ViaCepDataSource(NetworkManager()));
  getIt.registerSingleton<AddressDAO>(AddressDAO(DatabaseHelper()));
}

void repositoryModule() {
  // Registra os repositórios

  getIt.registerSingleton<AddressRepository>(AddressRepositoryImpl(
      viaCepDataSource: ViaCepDataSource(NetworkManager())));

  getIt.registerSingleton<AddressLocalRepository>(
      AddressLocalRepositoryImpl(addressDAO: AddressDAO(DatabaseHelper())));
}

void viewModelModule() {
  getIt.registerFactory<AddressViewModel>(() => AddressViewModel(
        getIt.get<AddressRepository>(),
        getIt.get<AddressLocalRepository>(),
      ));

  getIt.registerFactory<HistoryViewModel>(() => HistoryViewModel(
        getIt.get<AddressLocalRepository>(),
      ));
}
