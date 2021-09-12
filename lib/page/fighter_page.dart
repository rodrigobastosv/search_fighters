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
                  'Cartel: ${fighter.wins?.qtd ?? 0} - ${fighter.losses?.qtd ?? 0} - ${fighter.draws}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Vitórias:'),
                      Text('Quantidade: ${fighter.wins?.qtd ?? 0}'),
                      Text('Knockout: ${fighter.wins?.knockout ?? 0}'),
                      Text('Submissão: ${fighter.wins?.submission ?? 0}'),
                      Text('Decisão: ${fighter.wins?.decision ?? 0}'),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Column(
                    children: [
                      Text('Derrotas:'),
                      Text('Quantidade: ${fighter.losses?.qtd ?? 0}'),
                      Text('Knockout: ${fighter.losses?.knockout ?? 0}'),
                      Text('Submissão: ${fighter.losses?.submission ?? 0}'),
                      Text('Decisão: ${fighter.losses?.decision ?? 0}'),
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
                          Text(fighter.fights[i].result.toString().toUpperCase()),
                      trailing:
                          Text(fighter.fights[i].date.toString().toUpperCase()),
                      title: Text(fighter.fights[i].opponent),
                      subtitle: Text(fighter.fights[i].event),
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
