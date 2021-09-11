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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
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
                        ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (_, i) => ListTile(
                            onTap: () => Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (_) => FighterPage(
                                  fighter: _fighters![i],
                                ),
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(_fighters![i].imageUrl),
                            ),
                            title: Text(_fighters![i].name),
                            subtitle: Text(
                              '${_fighters![i].wins!.qtd} - ${_fighters![i].losses!.qtd} - ${_fighters![i].draws}',
                            ),
                          ),
                          itemCount: _fighters!.length,
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
