import 'package:projeto_final_semana_5/empresa.dart';
import 'package:projeto_final_semana_5/endereco.dart';
import 'package:uuid/uuid.dart';

void main(List<String> arguments) {
  Uuid uuid = Uuid();
  Empresa empresa = Empresa();
  Endereco endereco = Endereco();

  endereco.setLogradouro("Rua x");
  endereco.setNumero(123);

  empresa.setEndereco(endereco);
  empresa.setId(uuid);
  print("\x1B[2J\x1B[0;0H");
  print(empresa);
}
