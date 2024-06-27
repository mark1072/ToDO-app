import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/sheared/componant/empty_task.dart';

import '../../sheared/bloc/todo_cubit.dart';
import '../../sheared/bloc/todo_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../sheared/componant/build_item.dart';

class CompleteTasks extends StatelessWidget {
  const CompleteTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<String> choices = ['unCompleted', 'Delete'];
        var cubit = TodoCubit.get(context);
        return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ConditionalBuilder(
              condition: cubit.complete.isNotEmpty,
              builder: (context) =>
                  ListView.separated(
                    itemBuilder: (context, index) {
                      // ignore: prefer_function_declarations_over_variables
                      PopupMenuItemSelected function = (select) {
                        if (select == choices[0]) {
                          cubit.updateDatabase(status: 'unComplete', id: cubit
                              .complete[index]["id"]);
                          print('unComplete');
                        } else {
                          cubit.deleteDatabase(id: cubit.complete[index]["id"]);
                          print("Delete");
                        }
                      };
                      return itemBuilder(context, choices: choices,
                          onSelectPopButton: function,
                          model: cubit.complete[index]);
                    },
                    itemCount: cubit.complete.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 12.0,),
                  ),
              fallback: (context)=>emptyTask(),
            )
        );
      },
    );
  }
}
