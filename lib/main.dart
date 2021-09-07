import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/hive/hive_boxes.dart';
import 'pages/home_page/home_page.dart';
import 'services/master_detail_bloc.dart';

void main() async {
  await Hive.initFlutter();
  await HiveBoxes.initialize();
  runApp(const GuerrillaApp());
}

class GuerrillaApp extends StatelessWidget {
  const GuerrillaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guerrilla Mail',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(
        create: (context) =>
            MasterDetailBloc()..add(const MasterDetailInitialization()),
        child: const HomePage(),
      ),
    );
  }
}
