import '../database/AddressDAO.dart';
import '../model/address_local.dart';
import 'address_local_repository.dart';

class AddressLocalRepositoryImpl extends AddressLocalRepository {
  AddressLocalRepositoryImpl({required this.addressDAO});

  final AddressDAO addressDAO;

  @override
  Future<List<AddressLocal?>> getAddress() async {
    return await addressDAO.getAllAddresses();
  }

  @override
  Future saveAddress(AddressLocal address) async {
    return await addressDAO.insertAddress(address);
  }
}
