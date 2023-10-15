import 'package:flutter/material.dart';
import 'helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Helper helper = Helper();

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> marcadordePontos = [];
  void respostaCorreta(bool resp) {
    if (helper.obterReposta() == resp) {
      marcadordePontos.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      marcadordePontos.add(const Icon(
        Icons.close,
        color: Colors.grey,
      ));
    }
  }

  Expanded botoes(String texto, bool resp) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.black),
          child: Text(
            texto,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            if (helper.proximaPergunta() == true) {
              setState(
                () {
                  respostaCorreta(resp);
                },
              );
            } else {
              setState(
                () {
                  respostaCorreta(resp);
                  Alert(
                    context: context,
                    type: AlertType.info,
                    title: "Quiz Finalizado",
                    desc: "Obrigado por jogar",
                    buttons: [
                      DialogButton(
                        width: 120,
                        onPressed: () {
                          setState(() {
                            marcadordePontos.clear();
                            helper.zerarIndice();
                            Navigator.pop(context);
                          });
                        },
                        child: const Text(
                          "Fechar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ).show();
                },
              );
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                helper.obterEnunciado(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        botoes('Verdadeiro', true),
        botoes('Falso', false),
        Row(
          children: marcadordePontos,
        )
      ],
    );
  }
}
