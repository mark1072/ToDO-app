// ignore_for_file: prefer_function_declarations_over_variables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/sheared/bloc/todo_cubit.dart';
import 'package:todo/sheared/bloc/todo_cubit.dart';
import 'package:todo/sheared/componant/build_item.dart';
import 'package:todo/sheared/componant/empty_task.dart';
import 'package:todo/sheared/constant/colors.dart';

import '../../sheared/bloc/todo_states.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.allTask.isNotEmpty,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return itemBuilderWithMenu(context,
                    model: cubit.allTask[index]);
              },
              itemCount: cubit.allTask.length,
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
          fallback: (context) => emptyTask(),
        );
      },
    );
  }
}
