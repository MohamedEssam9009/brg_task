import 'package:brg_task/core/di/injection.dart';
import 'package:brg_task/view/screens/main_screen.dart';
import 'package:brg_task/view_model/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BRG Task',
      theme: ThemeData(useMaterial3: false),
      home: BlocProvider(
        create: (context) => getIt<PostCubit>(),
        child: const MainScreen(),
      ),
    );
  }
}
