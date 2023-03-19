import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/network.dart';

setupInjectionService() {
  RepositoryProvider<NetworkManager>(
    create: (context) => NetworkManager(),
  );
}
