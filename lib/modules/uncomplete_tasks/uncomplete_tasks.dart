import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/sheared/componant/empty_task.dart';

import '../../sheared/bloc/todo_cubit.dart';
import '../../sheared/bloc/todo_states.dart';
import '../../sheared/componant/build_item.dart';

class UnCompleteTasks extends StatelessWidget {
  const UnCompleteTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<String> choices = ['Completed', 'Delete'];
        // ignore: prefer_function_declarations_over_variables
        var cubit = TodoCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.unComplete.isNotEmpty,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                // ignore: prefer_function_declarations_over_variables
                PopupMenuItemSelected function = (select) {
                  if (select == choices[0]) {
                    cubit.updateDatabase(
                        status: 'complete', id: cubit.unComplete[index]["id"]);
                    print('complete');
                  } else {
                    cubit.deleteDatabase(id: cubit.unComplete[index]["id"]);
                    print("Delete");
                  }
                };
                return itemBuilder(context,
                    choices: choices,
                    onSelectPopButton: function,
                    model: cubit.unComplete[index]);
              },
              itemCount: cubit.unComplete.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 12.0,
              ),
            ),
          ),
          fallback: (context) => emptyTask(),
        );
      },
    );
  }
}
