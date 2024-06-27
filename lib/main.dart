import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/layout/layout.dart';
import 'package:todo/sheared/bloc/todo_cubit.dart';
import 'package:todo/sheared/constant/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit()..createDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme:  const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.0,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: White,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        home: Layout(),
      ),
    );
  }
}
