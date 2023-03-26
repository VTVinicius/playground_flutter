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

  // Método para converter AddressLocal para Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'cidade': cidade,
      'uf': uf,
      'bairro': bairro,
      'rua': rua,
    };
  }

  // Construtor para converter Map<String, dynamic> para AddressLocal
  AddressLocal.fromJson(Map<String, dynamic> json)
      : cep = json['cep'],
        cidade = json['cidade'],
        uf = json['uf'],
        bairro = json['bairro'],
        rua = json['rua'];
}
