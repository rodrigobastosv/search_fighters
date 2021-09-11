import 'package:flutter/material.dart';
import 'package:search_fighters/model/fighter_model.dart';

class FighterPage extends StatelessWidget {
  const FighterPage({
    Key? key,
    required this.fighter,
  }) : super(key: key);

  final FighterModel fighter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(38),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Nome: ${fighter.name}'),
              Text('Idade: ${fighter.age}'),
              Text('Data de Nascimento: ${fighter.birth}'),
              Text('Naturalidade: ${fighter.city}'),
              Text('Nacionalidade: ${fighter.country}'),
              Text('Altura: ${fighter.height}'),
              Text('Peso: ${fighter.weight}'),
              const SizedBox(height: 48),
              Text(
                  'Cartel: ${fighter.wins!.qtd} - ${fighter.losses!.qtd} - ${fighter.draws}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Vitórias:'),
                      Text('Quantidade: ${fighter.wins!.qtd}'),
                      Text('Knockout: ${fighter.wins!.knockout}'),
                      Text('Submissão: ${fighter.wins!.submission}'),
                      Text('Decisão: ${fighter.wins!.decision}'),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Column(
                    children: [
                      Text('Derrotas:'),
                      Text('Quantidade: ${fighter.losses!.qtd}'),
                      Text('Knockout: ${fighter.losses!.knockout}'),
                      Text('Submissão: ${fighter.losses!.submission}'),
                      Text('Decisão: ${fighter.losses!.decision}'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 48),
              SingleChildScrollView(
                child: SizedBox(
                  height: 600,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (_, i) => ListTile(
                      leading:
                          Text(fighter.fights[0].result.toString().toUpperCase()),
                      trailing:
                          Text(fighter.fights[0].date.toString().toUpperCase()),
                      title: Text(fighter.fights[0].opponent),
                      subtitle: Text(fighter.fights[0].event),
                    ),
                    itemCount: fighter.fights.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
