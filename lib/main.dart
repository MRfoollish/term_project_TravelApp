import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:term_project/cubit/app_cubit.dart';
import 'package:term_project/cubit/app_cubit_logics.dart';
import 'package:term_project/pages/detail_page.dart';
import 'package:term_project/pages/navpages/main_page.dart';
import 'package:term_project/pages/welcome_page.dart';
import 'package:term_project/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context)=>AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      )
    );
  }
}
