import 'package:flutter/material.dart';

import 'core/http_search_fighter_repository.dart';
import 'page/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(
        repository: HttpSearchFighterRepository(),
      ),
    );
  }
}