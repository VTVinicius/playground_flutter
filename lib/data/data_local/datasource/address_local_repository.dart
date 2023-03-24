import '../../data_remote/model/AddressResponse.dart';
import '../model/address_local.dart';

abstract class AddressLocalRepository {

  Future saveAddress(AddressLocal address);

  Future<List<AddressLocal?>> getAddress();
}
