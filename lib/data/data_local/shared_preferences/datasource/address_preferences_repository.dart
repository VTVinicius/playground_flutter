abstract class AddressPreferencesRepository {
  Future<void> saveLastCEP(String cep);

  Future<String?> getLastCEP();
}
