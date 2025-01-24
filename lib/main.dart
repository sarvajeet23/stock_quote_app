import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'client/api_service.dart';
import 'views/home/bloc/home_bloc.dart';
import 'views/home/bloc/home_event.dart';
import 'views/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => HomeBloc(ApiService())..add(FetchStocks()),
        child: HomePage(),
      ),
    );
  }
}
