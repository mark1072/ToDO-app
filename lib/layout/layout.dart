import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/modules/add_task/add_task.dart';
import 'package:todo/modules/all_tasks/all_tasks.dart';
import 'package:todo/modules/complete_tasks/complete_tasks.dart';
import 'package:todo/modules/favourite_tasks/favourite_tasks.dart';
import 'package:todo/modules/uncomplete_tasks/uncomplete_tasks.dart';
import 'package:todo/sheared/bloc/todo_cubit.dart';
import 'package:todo/sheared/bloc/todo_cubit.dart';
import 'package:todo/sheared/bloc/todo_states.dart';
import 'package:todo/sheared/constant/colors.dart';
import 'package:todo/sheared/style/icon/icon_broken.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'ToDo',
                style: GoogleFonts.raleway(
                  fontSize: 25.0,
                  letterSpacing: 5.0,
                  fontWeight: FontWeight.w500,
                  color: Black,
                ),
              ),
              bottom: TabBar(
                labelPadding: const EdgeInsets.all(3),
                indicatorColor: Black,
                indicatorWeight: 2,
                unselectedLabelColor: Grey,
                labelColor: Black,
                tabs: [
                  Tab(
                    child: Text(
                      'All',
                      style: GoogleFonts.roboto(fontSize: 13),
                    ),
                  ),
                  Tab(
                      child: Text(
                    'UnCompleted',
                    style: GoogleFonts.roboto(fontSize: 13),
                  )),
                  Tab(
                      child: Text(
                    'Completed',
                    style: GoogleFonts.roboto(fontSize: 13),
                  )),
                  Tab(
                      child: Text(
                    'Favorite',
                    style: GoogleFonts.roboto(fontSize: 13),
                  )),
                ],
              ),
            ),
            floatingActionButton: SizedBox(
              width: 100.0,
              height: 50.0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddTask(),
                    ),
                  );
                },
                backgroundColor: mainColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    Text(
                      'Add Task',
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: TabBarView(
              children: [
                AllTasks(),
                UnCompleteTasks(),
                CompleteTasks(),
                FavouriteTasks(),
              ],
            ),
          ),
        );
      },
    );
  }
}
