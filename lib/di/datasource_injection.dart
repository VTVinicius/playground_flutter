import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter/data/repository/address_repository_impl.dart';

import '../core/network.dart';
import '../data/datasource/ViaCepDataSource.dart';
import '../data/repository/address_repository.dart';

setupInjectionDataSource() {
  RepositoryProvider<ViaCepDataSource>(
    create: (context) => ViaCepDataSource(context.read<NetworkManager>()),
  );
  RepositoryProvider<AddressRepository>(
    create: (context) => AddressRepositoryImpl(
        viaCepDataSource: context.read<ViaCepDataSource>()),
  );
}
