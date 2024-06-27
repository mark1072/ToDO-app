import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/sheared/componant/empty_task.dart';

import '../../sheared/bloc/todo_cubit.dart';
import '../../sheared/bloc/todo_states.dart';
import '../../sheared/componant/build_item.dart';

class FavouriteTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.favourite.isNotEmpty, builder: (context) =>
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return itemBuilderWithMenu(
                      context, model: cubit.favourite[index]);
                },
                itemCount: cubit.favourite.length,
                separatorBuilder: (context, index) =>
                const SizedBox(height: 12.0,),
              ),
            ), fallback: (context) => emptyTask())
        ;
      },
    );
  }
}
