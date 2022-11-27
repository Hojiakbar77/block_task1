import 'package:block_task1/dog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/image_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        color: Colors.white,
        title: 'Dog Image',
        theme: ThemeData(


          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => ImageBloc()..add(ImageLoadEvent()),
          child: Dogview(),
        )
    );
  }
}

