import 'package:playground_flutter/data/data_local/shared_preferences/keys/feature_address_preferences_keys.dart';

import '../preferences_helper.dart';
import 'address_preferences_repository.dart';

class AddressPreferencesRepositoryImpl extends AddressPreferencesRepository {
  AddressPreferencesRepositoryImpl({required this.preferencesHelper});

  final PreferencesHelper preferencesHelper;


  @override
  Future<String?> getLastCEP() async {
    return await preferencesHelper
        .getString(FeatureAddressPreferencesKeys.LAST_CEP_STRING.name);
  }

  @override
  Future<void> saveLastCEP(String cep) async {
    return await preferencesHelper.saveString(
        FeatureAddressPreferencesKeys.LAST_CEP_STRING.name, cep);
  }
}
