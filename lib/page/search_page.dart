import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_fighters/core/search_fighter_repository.dart';
import 'package:search_fighters/model/fighter_model.dart';
import 'package:search_fighters/page/fighter_page.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key? key,
    required this.repository,
  }) : super(key: key);

  final SearchFighterRepository repository;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late GlobalKey<FormState> _formKey;
  String? _term;
  List<FighterModel>? _fighters;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (term) =>
                            term!.isEmpty ? 'Campo Obrigatório' : null,
                        onSaved: (term) => _term = term,
                        decoration: InputDecoration(
                          hintText: 'Digite aqui nome ou apelido do lutador...',
                          suffix: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            onPressed: () async {
                              final _form = _formKey.currentState!;
                              if (_form.validate()) {
                                _form.save();

                                setState(() {
                                  _isLoading = true;
                                });
                                try {
                                  final fighters = await widget.repository
                                      .getFighters(_term!);
                                  setState(() {
                                    _fighters = fighters;
                                  });
                                } finally {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      if (_fighters != null)
                        ..._fighters!.map(
                          (fighter) {
                            return ListTile(
                              onTap: () => Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (_) => FighterPage(
                                    fighter: fighter,
                                  ),
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  fighter.imageUrl != null
                                      ? fighter.imageUrl!
                                      : 'https://th.bing.com/th/id/OIP.To3xjJmt3xBLqB_9FfQcvQHaHu?pid=ImgDet&rs=1',
                                ),
                              ),
                              title: Text(fighter.name),
                              subtitle: Text(
                                '${fighter.wins?.qtd ?? 0} - ${fighter.losses?.qtd ?? 0} - ${fighter.draws}',
                              ),
                            );
                          },
                        ).toList(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
