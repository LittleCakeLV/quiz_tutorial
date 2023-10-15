import 'perguntas.dart';

class Helper {
  int _indicePerguntas = 0;
  final List<Perguntas> _perguntas = [
    Perguntas(
        true, 'O metrô é um dos meios de transporte mais seguros do mundo.'),
    Perguntas(true, 'A culinária brasileira é uma das melhores do mundo.'),
    Perguntas(false,
        'Vacas podem voar, assim como peixes utilizam os pés para andar.'),
    Perguntas(false, 'A maioria dos peixes podem viver fora da água.'),
    Perguntas(false, 'A lâmpada foi inventada por um brasileiro.'),
    Perguntas(false,
        'É possível utilizar a carteira de habilitação de carro para dirigir um avião.'),
    Perguntas(true, 'O Brasil possui 26 estados e 1 Distrito Federal.'),
    Perguntas(
        true, 'Bitcoin é o nome dado a uma das moedas virtuais mais famosas.'),
    Perguntas(true, '1 minuto equivale a 60 segundos.'),
    Perguntas(false, '1 segundo equivale a 200 milissegundos.'),
    Perguntas(true,
        'O Burj Khalifa, em Dubai, é considerado o maior prédio do mundo.'),
    Perguntas(false, 'Ler após uma refeição prejudica a visão humana.'),
    Perguntas(
        false, 'O cartão de crédito pode ser considerado uma moeda virtual.'),
  ];

  String obterEnunciado() {
    return _perguntas[_indicePerguntas].enunciado;
  }

  bool obterReposta() {
    return _perguntas[_indicePerguntas].resposta;
  }

  bool proximaPergunta() {
    if (_indicePerguntas < _perguntas.length - 1) {
      _indicePerguntas++;
      return true;
    } else {
      return false;
    }
  }

  void zerarIndice() {
    _indicePerguntas = 0;
  }
}
