
import 'package:flutter/material.dart';
import 'package:playground_flutter/data/data_remote/model/AddressResponse.dart';

abstract class AddressRepository{
  Future<AddressResponse?> getAddress(String cep);
}