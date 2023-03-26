class AddressLocal {
  final String cep;
  final String cidade;
  final String uf;
  final String bairro;
  final String rua;

  AddressLocal(
      {required this.cep,
      required this.cidade,
      required this.uf,
      required this.bairro,
      required this.rua});

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'cidade': cidade,
      'uf': uf,
      'bairro': bairro,
      'rua': rua,
    };
  }

  factory AddressLocal.fromMap(Map<String, dynamic> map) {
    return AddressLocal(
      cep: map['cep'],
      cidade: map['cidade'],
      uf: map['uf'],
      bairro: map['bairro'],
      rua: map['rua'],
    );
  }
}
