import 'package:flutter_bloc/flutter_bloc.dart';


import '../core/network.dart';
import '../data/data_remote/datasource/ViaCepDataSource.dart';
import '../data/data_remote/repository/address_repository.dart';
import '../data/data_remote/repository/address_repository_impl.dart';


setupInjectionDataSource() {
  RepositoryProvider<ViaCepDataSource>(
    create: (context) => ViaCepDataSource(context.read<NetworkManager>()),
  );
  RepositoryProvider<AddressRepository>(
    create: (context) => AddressRepositoryImpl(
        viaCepDataSource: context.read<ViaCepDataSource>()),
  );
}
